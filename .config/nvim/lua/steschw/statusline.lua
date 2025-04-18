local Path = require("steschw.utils.path")
local Diagnostics = require("steschw.utils.diagnostics")

---@return string
local function format_filename_quickfix()
    local res = vim.fn.getqflist({
        title = true,
    })

    if res.title == "" or res.title == ":setqflist()" then
        return " Quickfix "
    end

    return string.format(" %s ", res.title)
end

---@return string
local function format_filename_help()
    return " Help "
end

---@return string
local function format_filename_oil()
    local dir = require("oil").get_current_dir()
    if dir == nil then
        return " Oil "
    end
    dir = vim.fn.fnamemodify(dir, ":.")

    if dir == "" then
        return " CWD-ROOT "
    end

    return string.format(" %s ", dir)
end

---@return string
local function format_filename_buf()
    local path = vim.api.nvim_buf_get_name(0)
    if path == "" then
        return " [No Name] "
    end

    if path:sub(1, 1) == "/" then
        return string.format(" %s ", Path.format_path_peak(path))
    end

    return string.format(" %s ", path)
end

---@return string
local function item_filename()
    local ft = vim.bo.filetype
    if ft == "qf" then
        return format_filename_quickfix()
    elseif ft == "help" then
        return format_filename_help()
    elseif ft == "oil" then
        return format_filename_oil()
    end

    return format_filename_buf()
end

---@return string
local function item_file_changes()
    local buf_info = vim.fn.getbufinfo("%")
    if #buf_info ~= 1 then
        return ""
    end

    if buf_info[1].changed == 1 then
        return ""
    end

    return ""
end

---@return string
local function item_qf()
    local ft = vim.bo.filetype
    if ft ~= "qf" then
        return ""
    end

    local res = vim.fn.getqflist({
        idx = 0,
        size = true,
    })

    return string.format(" %d of %d ", res.idx, res.size)
end

---@return string
local function item_grapple()
    local ft = vim.bo.filetype
    if ft == "" then
        return ""
    end

    local g = require("grapple")
    if not g.exists() then
        return ""
    end

    return string.format("  %s ", g.name_or_index())
end

---@return string
local function item_search_count()
    if vim.v.hlsearch == 0 then
        return ""
    end

    local ok, result = pcall(vim.fn.searchcount)
    if not ok then
        return ""
    end
    if result.incomplete == 1 then
        return ""
    elseif result.incomplete == 2 then
        return string.format(" %d/%d+ ", result.current, result.total)
    end

    if result.total == 0 then
        return ""
    end

    return string.format(" %d/%d ", result.current, result.total)
end

---@param severity vim.diagnostic.Severity
---@return string
local function item_diagnostics(severity)
    local sign = Diagnostics.get_sign_text(severity)
    local sign_prefix = vim.trim(sign)

    local diagnostics = vim.diagnostic.get(0, { severity = severity })
    if #diagnostics == 0 then
        return ""
    end

    return string.format(" %s:%d ", sign_prefix, #diagnostics)
end

---@return string
local function item_lazy_updates()
    local ls = require("lazy.status")
    if not ls.has_updates() then
        return ""
    end

    return string.format(" %s ", ls.updates())
end

local M = {}

---@return string
function M.active()
    return table.concat({
        "%#Statusline#",
        "%#StatusLineFileChangesActive#",
        item_file_changes(),
        "%#StatusLineFilenameActive#",
        item_filename(),
        "%#StatusLineQfActive#",
        item_qf(),
        "%#StatusLineGrappleActive#",
        item_grapple(),
        "%#StatusLineSearchCount#",
        item_search_count(),
        "%#StatusLineDiagnosticError#",
        item_diagnostics(vim.diagnostic.severity.ERROR),
        "%#StatusLineDiagnosticWarn#",
        item_diagnostics(vim.diagnostic.severity.WARN),
        "%#StatusLineDiagnosticInfo#",
        item_diagnostics(vim.diagnostic.severity.INFO),
        "%#StatusLineDiagnosticHint#",
        item_diagnostics(vim.diagnostic.severity.HINT),
        "%#Statusline#",
        "%=",
        "%#StatusLineLazyUpdates#",
        item_lazy_updates(),
        "%#Statusline#",
    })
end

---@return string
function M.inactive()
    return table.concat({
        "%#StatuslineNC#",
        "%#StatusLineFileChangesInactive#",
        item_file_changes(),
        "%#StatusLineFilenameInactive#",
        item_filename(),
        "%#StatusLineQfInactive#",
        item_qf(),
        "%#StatusLineGrappleInactive#",
        item_grapple(),
        "%#StatuslineNC#",
    })
end

---@return string
function M.create()
    local is_active = vim.api.nvim_get_current_win() == tonumber(vim.g.actual_curwin)
    return is_active and M.active() or M.inactive()
end

return M
