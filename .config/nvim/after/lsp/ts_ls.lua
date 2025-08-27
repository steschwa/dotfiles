local keymap = require("steschw.utils.keys").keymap

local function remove_unused_imports()
    vim.lsp.buf.code_action({
        context = {
            diagnostics = {},
            ---@diagnostic disable-next-line: assign-type-mismatch
            only = { "source.removeUnusedImports.ts" },
        },
        filter = function(action)
            return action.kind == "source.removeUnusedImports.ts"
        end,
        apply = true,
    })
end

return {
    ---@param _ vim.lsp.Client
    ---@param bufnr number
    on_attach = function(_, bufnr)
        keymap("n", "gu", remove_unused_imports, { buffer = bufnr })
    end,
}
