return {
    "stevearc/conform.nvim",
    lazy = true,
    config = function()
        local conform = require("conform")

        conform.setup({
            notify_on_error = false,
            formatters_by_ft = {
                css = { "biome-check", "prettier" },
                go = { "golangci-lint" },
                graphql = { "biome-check", "prettier" },
                html = { "prettier" },
                javascript = { "biome-check", "prettier" },
                javascriptreact = { "biome-check", "prettier" },
                json = { "biome-check", "prettier" },
                jsonc = { "biome-check", "prettier" },
                lua = { "stylua" },
                markdown = { "prettier" },
                python = { "ruff_format" },
                scss = { "prettier" },
                sql = { "sqruff" },
                typescript = { "biome-check", "prettier" },
                typescriptreact = { "biome-check", "prettier" },
                yaml = { "prettier" },
            },
            default_format_opts = {
                lsp_format = "fallback",
                stop_after_first = true,
            },
        })
    end,
}
