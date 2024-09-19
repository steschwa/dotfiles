local M = {}

-- format the current buffer
function M.format()
    pcall(require("conform").format, {
        bufnr = 0,
    })
end

return M
