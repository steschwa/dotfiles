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
                "golangci_lint_ls",
                "gopls",
                "graphql",
                "html",
                "jsonls",
                "just",
                "lemminx",
                "lua_ls",
                "marksman",
                "nushell",
                "prismals",
                "pyrefly",
                "ruff",
                "rust_analyzer",
                "tailwindcss",
                "ts_ls",
                "yamlls",
                -- "postgres_lsp",
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
