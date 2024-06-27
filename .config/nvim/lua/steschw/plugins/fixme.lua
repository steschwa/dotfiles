local function provider_severity(item)
    local severity = vim.diagnostic.severity[item.type]
    if not severity then
        return { text = "" }
    end

    local severity_name = vim.diagnostic.severity[severity]
    if type(severity_name) ~= "string" or severity_name == "" then
        return { text = "" }
    end

    local hl = ({
        [vim.diagnostic.severity.ERROR] = "DiagnosticError",
        [vim.diagnostic.severity.WARN] = "DiagnosticWarn",
        [vim.diagnostic.severity.INFO] = "DiagnosticInfo",
        [vim.diagnostic.severity.HINT] = "DiagnosticHint",
    })[severity]

    return {
        text = string.format("%s", severity_name:upper()),
        hl = hl,
    }
end

local function provider_lnum(item)
    local lnum = item.lnum or item.end_lnum

    return {
        text = tostring(lnum),
        hl = "Comment",
    }
end

local function provider_filename(item)
    local path = vim.fn.bufname(item.bufnr)
    local filename = vim.fn.fnamemodify(path, ":t")

    return {
        text = filename,
        hl = "FixmeFilepath",
    }
end

local function provider_text(item)
    if item.text == "" then
        return { text = "" }
    end

    return {
        text = vim.trim(item.text),
        hl = "FixmeText",
    }
end

return {
    dir = "/Volumes/Projekte/fixme.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        require("fixme").setup({
            selectors = {
                {
                    columns = {
                        { provider_severity },
                        { provider_filename, provider_lnum },
                        { provider_text },
                    },
                    use = function(qf_id)
                        local context = vim.fn.getqflist({
                            id = qf_id,
                            context = true,
                        }).context

                        return context == "diagnostics"
                    end,
                },
                {
                    columns = {
                        { provider_filename, provider_lnum },
                        { provider_text },
                    },
                },
            },
            column_separator = " | ",
            cell_separator = " ",
        })
    end,
}
