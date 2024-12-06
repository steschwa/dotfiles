local M = {}

--- @return string
function M.filename()
    local path = vim.fn.expand("%")
    return vim.fn.fnamemodify(path, ":t:r")
end

return M
