return {
    "stevearc/conform.nvim",
    cmd = "ConformInfo",
    config = function()
        local conform = require("conform")

        conform.setup({
            notify_on_error = false,
            formatters_by_ft = {
                bash = { "shfmt" },
                css = { "oxfmt", "prettier" },
                d2 = { "d2" },
                go = { "golangci-lint" },
                graphql = { "oxfmt", "prettier" },
                html = { "oxfmt", "prettier" },
                javascript = { "oxfmt", "prettier" },
                javascriptreact = { "oxfmt", "prettier" },
                json = { "oxfmt", "prettier" },
                jsonc = { "oxfmt", "prettier" },
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
                typescript = { "oxfmt", "prettier" },
                typescriptreact = { "oxfmt", "prettier" },
                yaml = { "oxfmt", "yamlfmt" },
            },
            default_format_opts = {
                lsp_format = "fallback",
                stop_after_first = true,
            },
        })
    end,
}
