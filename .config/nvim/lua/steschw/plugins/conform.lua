return {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        -- MasonInstall prettierd
        -- MasonInstall goimports
        -- MasonInstall stylua
        -- MasonInstall ruff
        -- MasonInstall sql-formatter

        local conform = require("conform")

        conform.setup({
            notify_on_error = false,
            formatters_by_ft = {
                css = { "prettierd" },
                go = { "goimports" },
                graphql = { "prettierd" },
                html = { "prettierd" },
                javascript = { "prettierd" },
                javascriptreact = { "prettierd" },
                json = { "prettierd" },
                jsonc = { "prettierd" },
                lua = { "stylua" },
                markdown = { "prettierd" },
                python = { "ruff_format" },
                scss = { "prettierd" },
                sql = { "sql_formatter" },
                typescript = { "prettierd" },
                typescriptreact = { "prettierd" },
                yaml = { "prettierd" },
            },
            formatters = {
                prettierd = {
                    env = {
                        PRETTIERD_DEFAULT_CONFIG = vim.fn.expand("~/.config/prettier/.prettierrc"),
                    },
                },
            },
            default_format_opts = {
                lsp_format = "fallback",
            },
        })
    end,
}
