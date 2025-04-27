return {
    {
        "neovim/nvim-lspconfig",
        version = "*",
        dependencies = {
            "williamboman/mason.nvim",
        },
        config = function()
            -- MasonInstall dockerfile-language-server
            -- MasonInstall docker-compose-language-server
            -- MasonInstall gopls
            -- MasonInstall lua-language-server
            -- MasonInstall marksman
            -- MasonInstall pyright
            -- MasonInstall ruff
            -- MasonInstall postgrestools
            -- MasonInstall texlab
            -- MasonInstall taplo
            -- MasonInstall yamlls
            -- MasonInstall json-lsp
            -- MasonInstall html-lsp
            -- MasonInstall css-lsp
            -- MasonInstall tailwindcss-language-server
            -- MasonInstall eslint-lsp
            -- MasonInstall biome
            -- MasonInstall vtsls

            local servers = {
                "yamlls",
                "taplo",
                "texlab",
                "postgres_lsp",
                "ruff",
                "pyright",
                "nushell",
                "marksman",
                "lua_ls",
                "gopls",
                "docker_compose_language_service",
                "dockerls",
                "html",
                "cssls",
                "tailwindcss",
                "jsonls",
                "eslint",
                "biome",
                "vtsls",
            }

            vim.lsp.enable(servers)
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
