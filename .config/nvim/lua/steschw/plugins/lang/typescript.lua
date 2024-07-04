local keymap = require("steschw.utils.keys").keymap

return {
    {
        "pmizio/typescript-tools.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "neovim/nvim-lspconfig",
        },
        ft = {
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
        },
        config = function()
            require("typescript-tools").setup({
                on_attach = function(_, bufnr)
                    local keymap_opts = { buffer = bufnr }

                    keymap("n", "gu", "<cmd>TSToolsRemoveUnusedImports<cr>", keymap_opts)
                    keymap("n", "gi", "<cmd>TSToolsAddMissingImports<cr>", keymap_opts)
                end,
            })
        end,
    },
}
