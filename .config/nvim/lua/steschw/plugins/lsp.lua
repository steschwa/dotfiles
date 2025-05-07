return {
    {
        "neovim/nvim-lspconfig",
        version = "*",
        dependencies = {
            "williamboman/mason.nvim",
        },
        config = function()
            -- MasonInstall biome
            -- MasonInstall css-lsp
            -- MasonInstall docker-compose-language-server
            -- MasonInstall dockerfile-language-server
            -- MasonInstall eslint-lsp
            -- MasonInstall gopls
            -- MasonInstall html-lsp
            -- MasonInstall json-lsp
            -- MasonInstall lua-language-server
            -- MasonInstall marksman
            -- MasonInstall postgrestools
            -- MasonInstall pyright
            -- MasonInstall ruff
            -- MasonInstall tailwindcss-language-server
            -- MasonInstall taplo
            -- MasonInstall texlab
            -- MasonInstall vtsls
            -- MasonInstall yamlls

            vim.lsp.config("texlab", {
                settings = {
                    texlab = {
                        build = {
                            executable = "tectonic",
                            args = {
                                "-X",
                                "compile",
                                "%f",
                                "--synctex",
                                "--keep-logs",
                                "--keep-intermediates",
                            },
                        },
                        forwardSearch = {
                            executable = "sioyek",
                            args = {
                                "--reuse-window",
                                "--execute-command",
                                "toggle_synctex",
                                "--inverse-search",
                                'texlab inverse-search -i "%%1" -l %%2',
                                "--forward-search-file",
                                "%f",
                                "--forward-search-line",
                                "%l",
                                "%p",
                            },
                        },
                    },
                },
            })

            vim.lsp.config("yamlls", {
                filetypes = { "yaml", "yaml.docker-compose", "yaml.github-action" },
                settings = {
                    yaml = {
                        schemaStore = { enable = false, url = "" },
                        schemas = require("schemastore").yaml.schemas(),
                    },
                },
            })

            vim.lsp.enable({
                "biome",
                "cssls",
                "docker_compose_language_service",
                "dockerls",
                "eslint",
                "gopls",
                "html",
                "jsonls",
                "lua_ls",
                "marksman",
                "nushell",
                "postgres_lsp",
                "pyright",
                "ruff",
                "tailwindcss",
                "taplo",
                "texlab",
                "vtsls",
                "yamlls",
            })
        end,
    },
    {
        "williamboman/mason.nvim",
        cmd = "Mason",
        config = true,
    },
    {
        "b0o/schemastore.nvim",
        lazy = true,
    },

    -- LUA
    {
        "folke/lazydev.nvim",
        ft = "lua",
        config = true,
    },

    -- CSS
    {
        "steschwa/css-tools.nvim",
        version = "*",
        ft = "css",
        opts = {
            customData = {
                "/Users/stefan/.config/nvim/customData/tailwind.css-data.json",
            },
        },
    },

    -- TS/JS
    {
        "yioneko/nvim-vtsls",
        ft = {
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
        },
        config = function()
            require("vtsls").config({})
        end,
    },
}
