return {
    {
        "neovim/nvim-lspconfig",
        version = "*",
        config = function()
            vim.lsp.enable({
                "bashls",
                "cssls",
                "docker_language_server",
                "golangci_lint_ls",
                "gopls",
                "graphql",
                "html",
                "jsonls",
                "just",
                "lua_ls",
                "marksman",
                "nushell",
                "oxlint",
                "prismals",
                "ruff",
                "rust_analyzer",
                "tailwindcss",
                "ts_ls",
                -- "tsgo",
                "ty",
                "yamlls",
                -- "lemminx", -- xml
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
