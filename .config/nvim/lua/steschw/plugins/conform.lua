return {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        -- MasonInstall prettierd
        -- MasonInstall goimports
        -- MasonInstall stylua

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
                scss = { "prettierd" },
                typescript = { "prettierd" },
                typescriptreact = { "prettierd" },
                yaml = { "prettierd" },
            },
            formatters = {
                prettierd = {
                    env = {
                        PRETTIERD_DEFAULT_CONFIG = vim.fn.expand("~/dotfiles/.prettierrc"),
                    },
                },
            },
        })
    end,
}
