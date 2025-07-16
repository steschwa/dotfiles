return {
    "stevearc/conform.nvim",
    lazy = true,
    config = function()
        local conform = require("conform")

        conform.setup({
            notify_on_error = false,
            formatters = {
                prettierd = { require_cwd = true },
            },
            formatters_by_ft = {
                -- go = { "golangci-lint" },
                -- python = { "ruff_format" },
                -- sql = { "sqruff" },
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
                typescript = { "biome-check", "prettierd" },
                typescriptreact = { "biome-check", "prettierd" },
                yaml = { "prettierd" },
                rust = { "rustfmt" },
            },
            default_format_opts = {
                lsp_format = "fallback",
                stop_after_first = true,
            },
        })
    end,
}
