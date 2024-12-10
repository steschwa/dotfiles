return {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        -- MasonInstall prettierd
        -- MasonInstall goimports
        -- MasonInstall stylua
        -- MasonInstall ruff
        -- MasonInstall sql-formatter
        -- MasonInstall biome

        local conform = require("conform")

        conform.setup({
            notify_on_error = false,
            formatters_by_ft = {
                css = { "biome-check", "prettierd", stop_after_first = true },
                go = { "goimports" },
                graphql = { "biome-check", "prettierd", stop_after_first = true },
                html = { "prettierd" },
                javascript = { "biome-check", "prettierd", stop_after_first = true },
                javascriptreact = { "biome-check", "prettierd", stop_after_first = true },
                json = { "biome-check", "prettierd", stop_after_first = true },
                jsonc = { "biome-check", "prettierd", stop_after_first = true },
                lua = { "stylua" },
                markdown = { "prettierd" },
                python = { "ruff_format" },
                scss = { "prettierd" },
                sql = { "sql_formatter" },
                typescript = { "biome-check", "prettierd", stop_after_first = true },
                typescriptreact = { "biome-check", "prettierd", stop_after_first = true },
                yaml = { "prettierd" },
            },
            formatters = {
                prettierd = {
                    env = {
                        PRETTIERD_DEFAULT_CONFIG = vim.fn.expand("~/.config/prettier/.prettierrc"),
                    },
                },
                ["biome-check"] = {
                    require_cwd = true,
                },
            },
            default_format_opts = {
                lsp_format = "fallback",
            },
        })
    end,
}
