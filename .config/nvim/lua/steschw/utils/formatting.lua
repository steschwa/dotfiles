local M = {}

--- @param bufnr? number
function M.format(bufnr)
    pcall(require("conform").format, {
        bufnr = bufnr or 0,
    })
end

return M
