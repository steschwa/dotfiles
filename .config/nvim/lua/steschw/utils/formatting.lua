local M = {}

--- @param bufnr number 0 to use current buffer
function M.format(bufnr)
    pcall(require("conform").format, {
        bufnr = bufnr,
    })
end

return M
