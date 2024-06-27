return {
    "stevearc/conform.nvim",
    event = {
        "BufReadPre",
        "BufNewFile",
    },
    config = function()
        -- MasonInstall prettierd
        -- MasonInstall goimports
        -- MasonInstall stylua

        local conform = require("conform")

        conform.setup({
            notify_on_error = false,
            formatters_by_ft = {
                css = { "prettierd" },
                scss = { "prettierd" },
                go = { "goimports" },
                html = { "prettierd" },
                json = { "prettierd" },
                jsonc = { "prettierd" },
                lua = { "stylua" },
                markdown = { "prettierd" },
                javascript = { "prettierd" },
                javascriptreact = { "prettierd" },
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
