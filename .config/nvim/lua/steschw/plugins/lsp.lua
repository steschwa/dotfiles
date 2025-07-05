return {
    {
        "neovim/nvim-lspconfig",
        version = "*",
        config = function()
            vim.lsp.enable({
                -- "biome",
                "cssls",
                -- "docker_compose_language_service",
                -- "dockerls",
                "eslint",
                "gopls",
                "html",
                "jsonls",
                "lua_ls",
                "marksman",
                "nushell",
                "prismals",
                -- "postgres_lsp",
                -- "pyright",
                "graphql",
                -- "ruff",
                "tailwindcss",
                "ts_ls",
                -- "vtsls",
                "yamlls",
                -- "golangci_lint_ls",
                -- "tombi",
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
                "/Users/stefanschwaighofer/.config/nvim/customData/tailwind.css-data.json",
            },
        },
    },
}
