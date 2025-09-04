return {
    "stevearc/conform.nvim",
    cmd = "ConformInfo",
    config = function()
        local conform = require("conform")

        conform.setup({
            notify_on_error = false,
            formatters = {
                prettierd = { require_cwd = true },
            },
            formatters_by_ft = {
                go = { "golangci-lint" },
                python = {
                    "ruff_fix",
                    "ruff_organize_imports",
                    "ruff_format",
                    stop_after_first = false,
                },
                sql = { "sqruff" },
                bash = { "shfmt" },
                css = { "biome-check", "prettierd" },
                graphql = { "biome-check", "prettierd" },
                html = { "prettierd" },
                javascript = { "biome-check", "prettierd" },
                javascriptreact = { "biome-check", "prettierd" },
                json = { "biome-check", "prettierd" },
                jsonc = { "biome-check", "prettierd" },
                lua = { "stylua" },
                markdown = { "prettierd" },
                scss = { "prettierd" },
                sh = { "shfmt" },
                typescript = { "biome-check", "prettierd" },
                typescriptreact = { "biome-check", "prettierd" },
                yaml = { "yamlfmt" },
                rust = { "rustfmt" },
            },
            default_format_opts = {
                lsp_format = "fallback",
                stop_after_first = true,
            },
        })
    end,
}
