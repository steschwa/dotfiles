return {
    {
        "neovim/nvim-lspconfig",
        version = "*",
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
        "mason-org/mason.nvim",
        cmd = "Mason",
        event = "FileType",
        opts = {},
    },
    {
        "b0o/schemastore.nvim",
        lazy = true,
    },

    -- LUA
    {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {},
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
