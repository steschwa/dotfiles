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
    local hls = vim.api.nvim_get_hl(0, {})

    local bufid = vim.api.nvim_create_buf(false, true)
    local ns = vim.api.nvim_create_namespace("dump-hl")

    local line_nr = 0

    for name, hl in pairs(hls) do
        local bg = hl.bg and string.format("#%6x", hl.bg) or "NONE"
        local fg = hl.fg and string.format("#%6x", hl.fg) or "NONE"

        local line = string.format("%-40s bg=%7s fg=%7s link=%s", name, bg, fg, hl.link or "NONE")

        vim.api.nvim_buf_set_lines(bufid, line_nr, line_nr, false, { line })
        vim.hl.range(bufid, ns, name, { line_nr, 0 }, { line_nr, #name })
    end

    vim.cmd("vsplit")
    vim.api.nvim_set_current_buf(bufid)
end, {
    force = false,
    nargs = 0,
})
