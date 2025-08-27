return {
    ---@param _ vim.lsp.Client
    ---@param bufnr number
    on_attach = function(_, bufnr)
        require("steschw.utils.keys").keymap("n", "gu", function()
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
        end, { buffer = bufnr })
    end,
}
