return {
    {
        "neovim/nvim-lspconfig",
        version = "*",
        event = "VeryLazy",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "saghen/blink.cmp",
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

            vim.lsp.enable("dockerls")
            vim.lsp.enable("docker_compose_language_service")
            vim.lsp.enable("gopls")
            vim.lsp.enable("lua_ls")
            vim.lsp.enable("marksman")
            vim.lsp.enable("nushell")
            vim.lsp.enable("pyright")
            vim.lsp.enable("ruff")
            vim.lsp.enable("postgres_lsp")
            vim.lsp.enable("texlab")
            vim.lsp.enable("taplo")
            vim.lsp.enable("yamlls")
            vim.lsp.enable("html")
            vim.lsp.enable("cssls")
            vim.lsp.enable("tailwindcss")
            vim.lsp.enable("jsonls")
            vim.lsp.enable("eslint")
            vim.lsp.enable("biome")

            vim.lsp.config("*", {
                capabilities = require("blink.cmp").get_lsp_capabilities(),
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
