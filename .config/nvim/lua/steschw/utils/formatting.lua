local M = {}

---format the current buffer
---@param on_done? function
function M.format(on_done)
    pcall(require("conform").format, {
        async = true,
        bufnr = 0,
        lsp_format = "fallback",
    }, function()
        if not on_done then
            return
        end

        on_done()
    end)
end

return M
