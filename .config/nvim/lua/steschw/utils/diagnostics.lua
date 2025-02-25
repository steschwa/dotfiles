local M = {}

--- @class steschw.DiagnosticSign
--- @field name string
--- @field numhl string
--- @field text string
--- @field texthl string

--- @param name string
--- @return steschw.DiagnosticSign?
function M.get_sign_by_name(name)
    local sign = vim.fn.sign_getdefined(name)
    if type(sign) ~= "table" then
        return
    end
    if #sign < 1 then
        return
    end

    return sign[1] --[[@as steschw.DiagnosticSign]]
end

--- @param severity vim.diagnostic.Severity
--- @return steschw.DiagnosticSign?
function M.get_sign_by_severity(severity)
    local type = ({
        [vim.diagnostic.severity.ERROR] = "Error",
        [vim.diagnostic.severity.WARN] = "Warn",
        [vim.diagnostic.severity.INFO] = "Info",
        [vim.diagnostic.severity.HINT] = "Hint",
    })[severity]

    if not type then
        vim.notify_once("invalid sign severity: " .. severity, vim.log.levels.WARN)
        return
    end

    local name = "DiagnosticSign" .. type
    return M.get_sign_by_name(name)
end

return M
