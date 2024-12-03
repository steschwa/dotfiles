-- MasonInstall json-lsp
-- MasonInstall html-lsp
-- MasonInstall css-lsp
-- MasonInstall tailwindcss-language-server
-- MasonInstall eslint-lsp
-- MasonInstall biome

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
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "b0o/schemastore.nvim",
        },
        opts = function(_, opts)
            opts.servers.html = {}
            opts.servers.cssls = {}
            opts.servers.tailwindcss = {}
            opts.servers.jsonls = {
                settings = {
                    json = {
                        schemas = require("schemastore").json.schemas(),
                        validate = { enable = true },
                    },
                },
            }
            opts.servers.eslint = {
                settings = {
                    codeAction = {
                        showDocumentation = {
                            enable = false,
                        },
                    },
                },
            }
            opts.servers.biome = {}
        end,
    },
}
