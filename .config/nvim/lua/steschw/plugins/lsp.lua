return {
    {
        "neovim/nvim-lspconfig",
        version = "*",
        config = function()
            vim.lsp.enable({
                "bashls",
                "biome",
                "cssls",
                "docker_language_server",
                "eslint",
                "gopls",
                "graphql",
                "html",
                "jsonls",
                "lua_ls",
                "marksman",
                "nushell",
                "prismals",
                "rust_analyzer",
                "tailwindcss",
                "ts_ls",
                "yamlls",
                -- "golangci_lint_ls",
                -- "postgres_lsp",
                -- "pyright",
                -- "ruff",
                -- "tombi",
            })
        end,
    },
    {
        "mason-org/mason.nvim",
        cmd = "Mason",
        event = "FileType",
        opts = {
            ui = {
                backdrop = 100,
            },
        },
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
}
