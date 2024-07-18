local M = {}

--- @param bufnr number 0 to use current buffer
--- @param callback? fun()
function M.format(bufnr, callback)
    pcall(function()
        require("conform").format({
            bufnr = bufnr,
            async = true,
        }, callback)
    end)
end

return M
