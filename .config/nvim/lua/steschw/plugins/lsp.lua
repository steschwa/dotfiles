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
                -- "lemminx", -- xml
                "lua_ls",
                "marksman",
                "nushell",
                "prismals",
                "ruff",
                "rust_analyzer",
                "tailwindcss",
                "ts_ls",
                "ty",
                "yamlls",
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
