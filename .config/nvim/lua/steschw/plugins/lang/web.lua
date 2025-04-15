-- MasonInstall json-lsp
-- MasonInstall html-lsp
-- MasonInstall css-lsp
-- MasonInstall tailwindcss-language-server
-- MasonInstall eslint-lsp
-- MasonInstall biome
-- MasonInstall vtsls

local keymap = require("steschw.utils.keys").keymap
local LspUtils = require("steschw.utils.lsp")

return {
    {
        "yioneko/nvim-vtsls",
        ft = {
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
        },
        dependencies = {
            "neovim/nvim-lspconfig",
        },
        config = function()
            local vtsls = require("vtsls")
            vtsls.config({})

            local vtsls_lspconfig = vim.tbl_deep_extend("force", vtsls.lspconfig, {
                settings = {
                    vtsls = {
                        autoUseWorkspaceTsdk = true,
                        typescript = {
                            preferences = {
                                importModuleSpecifier = "non-relative",
                            },
                        },
                    },
                },
                ---@type vim.lsp.client.on_attach_cb
                on_attach = function(_, bufnr)
                    local keymap_opts = { buffer = bufnr }

                    keymap("n", "gu", "<cmd>VtsExec remove_unused_imports<cr>", keymap_opts)
                    keymap("n", "gi", "<cmd>VtsExec add_missing_imports<cr>", keymap_opts)
                end,
            })

            LspUtils.setup_server("vtsls", vtsls_lspconfig)
        end,
    },
    {
        "steschwa/css-tools.nvim",
        version = "*",
        ft = { "css" },
        opts = {
            customData = {
                "/Users/stefan/.config/nvim/customData/tailwind.css-data.json",
            },
        },
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
