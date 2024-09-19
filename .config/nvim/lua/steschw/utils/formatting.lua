local M = {}

-- format the current buffer
function M.format()
    pcall(require("conform").format, {
        bufnr = 0,
        lsp_format = "fallback",
    })
end

return M
