local M = {}

---@type table<vim.diagnostic.Severity, string>
local SIGN_TEXTS = {
    [vim.diagnostic.severity.ERROR] = "E",
    [vim.diagnostic.severity.WARN] = "W",
    [vim.diagnostic.severity.INFO] = "I",
    [vim.diagnostic.severity.HINT] = "H",
}

function M.get_signs()
    return SIGN_TEXTS
end

---@param severity vim.diagnostic.Severity
---@return string
function M.get_sign_text(severity)
    return SIGN_TEXTS[severity]
end

return M
