vim.api.nvim_create_user_command("Dump", function(opts)
    local res = vim.api.nvim_exec2(opts.fargs[1], { output = true })

    local lines = vim.split(res.output, "\n")

    local bufid = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_buf_set_lines(bufid, 0, -1, false, lines)
    vim.bo[bufid].filetype = "dump"

    vim.cmd("vsplit")
    vim.api.nvim_set_current_buf(bufid)
end, {
    force = false,
    nargs = 1,
    complete = "command",
})

vim.api.nvim_create_user_command("DumpHl", function()
    local hls_by_name = vim.api.nvim_get_hl(0, {})

    local bufid = vim.api.nvim_create_buf(false, true)
    local ns = vim.api.nvim_create_namespace("dump-hl")

    ---@class steschwa.DumpHlHighlightDef
    ---@field name string
    ---@field fg string
    ---@field bg string
    ---@field link string

    ---@type steschwa.DumpHlHighlightDef[]
    local hls = {}
    for name, hl in pairs(hls_by_name) do
        ---@type steschwa.DumpHlHighlightDef
        local def = {
            name = name,
            bg = hl.bg and string.format("#%6x", hl.bg) or "NONE",
            fg = hl.fg and string.format("#%6x", hl.fg) or "NONE",
            link = hl.link or "NONE",
        }

        table.insert(hls, def)
    end

    table.sort(hls, function(a, b)
        return a.name:lower() < b.name:lower()
    end)

    local line_nr = 0

    for _, def in ipairs(hls) do
        local line =
            string.format("%-40s bg=%7s fg=%7s link=%s", def.name, def.bg, def.fg, def.link)

        vim.api.nvim_buf_set_lines(bufid, line_nr, line_nr, false, { line })
        vim.hl.range(bufid, ns, def.name, { line_nr, 0 }, { line_nr, #def.name })

        line_nr = line_nr + 1
    end

    vim.cmd("vsplit")
    vim.api.nvim_set_current_buf(bufid)
end, {
    force = false,
    nargs = 0,
})
