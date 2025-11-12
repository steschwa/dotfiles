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
                css = { "biome-check", "prettier" },
                go = { "golangci-lint" },
                graphql = { "biome-check", "prettier" },
                html = { "biome-check", "prettier" },
                javascript = { "biome-check", "prettier" },
                javascriptreact = { "biome-check", "prettier" },
                json = { "biome-check", "prettier" },
                jsonc = { "biome-check", "prettier" },
                lua = { "stylua" },
                markdown = { "prettier" },
                python = {
                    "ruff_fix",
                    "ruff_organize_imports",
                    "ruff_format",
                    stop_after_first = false,
                },
                rust = { "rustfmt" },
                scss = { "prettier" },
                sh = { "shfmt" },
                sql = { "sleek" },
                typescript = { "biome-check", "prettier" },
                typescriptreact = { "biome-check", "prettier" },
                yaml = { "yamlfmt" },
            },
            default_format_opts = {
                lsp_format = "fallback",
                stop_after_first = true,
            },
        })
    end,
}
