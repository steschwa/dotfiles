local function cell_severity(item)
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
        text = severity_name:upper(),
        hl = hl,
    }
end

local function cell_lnum(item)
    local lnum = item.lnum or item.end_lnum

    return {
        text = tostring(lnum),
        hl = "Comment",
    }
end

local function cell_filename(item)
    local path = vim.fn.bufname(item.bufnr)
    local filename = vim.fn.fnamemodify(path, ":t")

    return {
        text = filename,
        hl = "FixmeFilepath",
    }
end

local function cell_file_icon(item)
    local path = vim.fn.bufname(item.bufnr)
    local filename = vim.fn.fnamemodify(path, ":t")
    local extension = vim.fn.fnamemodify(path, ":e")

    local icon, hl = require("nvim-web-devicons").get_icon(filename, extension)
    if icon ~= nil then
        icon = string.format("%s ", icon)
    end

    return {
        text = icon or " ",
        hl = hl or "Comment",
    }
end

local function cell_text(item)
    return {
        text = vim.trim(item.text),
        hl = "FixmeText",
    }
end

local COLUMNS_DIAGNOSTICS = {
    { cell_severity },
    { cell_file_icon, cell_filename, cell_lnum },
    { cell_text },
}
local COLUMNS_NORMAL = {
    { cell_file_icon, cell_filename, cell_lnum },
    { cell_text },
}

return {
    "steschwa/fixme.nvim",
    ft = "qf",
    opts = {
        columns = function(qf_id)
            local context = vim.fn.getqflist({
                id = qf_id,
                context = true,
            }).context

            if context == "diagnostics" then
                return COLUMNS_DIAGNOSTICS
            end

            return COLUMNS_NORMAL
        end,
        column_separator = " │ ",
        cell_separator = " ",
    },
}
