return {
    "stevearc/conform.nvim",
    lazy = true,
    config = function()
        local conform = require("conform")

        conform.setup({
            notify_on_error = false,
            formatters_by_ft = {
                css = { "biome-check", "prettier", stop_after_first = true },
                go = { "golangci-lint" },
                graphql = { "biome-check", "prettier", stop_after_first = true },
                html = { "prettier" },
                javascript = { "biome-check", "prettier", stop_after_first = true },
                javascriptreact = { "biome-check", "prettier", stop_after_first = true },
                json = { "biome-check", "prettier", stop_after_first = true },
                jsonc = { "biome-check", "prettier", stop_after_first = true },
                lua = { "stylua" },
                markdown = { "prettier" },
                python = { "ruff_format" },
                scss = { "prettier" },
                sql = { "sqruff" },
                typescript = { "biome-check", "prettier", stop_after_first = true },
                typescriptreact = { "biome-check", "prettier", stop_after_first = true },
                yaml = { "prettier" },
            },
            formatters = {
                ["biome-check"] = {
                    require_cwd = true,
                },
                ["bibtex-tidy"] = {
                    prepend_args = {
                        "--numeric",
                        "--space=4",
                        "--blank-lines",
                        "--strip-enclosing-braces",
                        "--trailing-commas",
                    },
                },
            },
            default_format_opts = {
                lsp_format = "fallback",
            },
        })
    end,
}
