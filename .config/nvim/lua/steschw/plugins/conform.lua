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
                css = { "biome", "prettierd", stop_after_first = true },
                go = { "goimports" },
                graphql = { "biome", "prettierd", stop_after_first = true },
                html = { "prettierd" },
                javascript = { "biome", "prettierd", stop_after_first = true },
                javascriptreact = { "biome", "prettierd", stop_after_first = true },
                json = { "biome", "prettierd", stop_after_first = true },
                jsonc = { "biome", "prettierd", stop_after_first = true },
                lua = { "stylua" },
                markdown = { "prettierd" },
                python = { "ruff_format" },
                scss = { "prettierd" },
                sql = { "sql_formatter" },
                typescript = { "biome", "prettierd", stop_after_first = true },
                typescriptreact = { "biome", "prettierd", stop_after_first = true },
                yaml = { "prettierd" },
            },
            formatters = {
                prettierd = {
                    env = {
                        PRETTIERD_DEFAULT_CONFIG = vim.fn.expand("~/.config/prettier/.prettierrc"),
                    },
                },
                biome = {
                    require_cwd = true,
                },
            },
            default_format_opts = {
                lsp_format = "fallback",
            },
        })
    end,
}
