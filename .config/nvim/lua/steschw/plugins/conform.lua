return {
    "stevearc/conform.nvim",
    cmd = "ConformInfo",
    config = function()
        local conform = require("conform")

        conform.setup({
            notify_on_error = false,
            -- formatters = {
            --     prettier = { require_cwd = true },
            -- },
            formatters_by_ft = {
                bash = { "shfmt" },
                css = { "biome-check", "oxfmt", "prettier" },
                d2 = { "d2" },
                go = { "golangci-lint" },
                graphql = { "biome-check", "oxfmt", "prettier" },
                html = { "biome-check", "oxfmt", "prettier" },
                javascript = { "biome-check", "oxfmt", "prettier" },
                javascriptreact = { "biome-check", "oxfmt", "prettier" },
                json = { "biome-check", "oxfmt", "prettier" },
                jsonc = { "biome-check", "oxfmt", "prettier" },
                lua = { "stylua" },
                markdown = { "oxfmt", "prettier" },
                python = {
                    "ruff_fix",
                    "ruff_organize_imports",
                    "ruff_format",
                    stop_after_first = false,
                },
                rust = { "rustfmt" },
                scss = { "oxfmt", "prettier" },
                sh = { "shfmt" },
                sql = { "sleek" },
                toml = { "oxfmt" },
                typescript = { "biome-check", "oxfmt", "prettier" },
                typescriptreact = { "biome-check", "oxfmt", "prettier" },
                yaml = { "oxfmt", "yamlfmt" },
            },
            default_format_opts = {
                lsp_format = "fallback",
                stop_after_first = true,
            },
        })
    end,
}
