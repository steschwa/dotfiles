return {
    "stevearc/conform.nvim",
    lazy = true,
    config = function()
        -- MasonInstall prettierd
        -- MasonInstall goimports
        -- MasonInstall stylua
        -- MasonInstall ruff
        -- MasonInstall sql-formatter
        -- MasonInstall biome
        -- MasonInstall bibtex-tidy
        -- MasonInstall tex-fmt
        -- rustup component add rustfmt
        -- MasonInstall taplo

        local conform = require("conform")

        conform.setup({
            notify_on_error = false,
            formatters_by_ft = {
                bib = { "bibtex-tidy" },
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
                rust = { "rustfmt" },
                scss = { "prettierd" },
                sql = { "sql_formatter" },
                tex = { "tex-fmt" },
                toml = { "taplo" },
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
                ["bibtex-tidy"] = {
                    prepend_args = {
                        "--numeric",
                        "--space=4",
                        "--blank-lines",
                        "--strip-enclosing-braces",
                        "--trailing-commas",
                    },
                },
                ["tex-fmt"] = {
                    prepend_args = { "--tabsize=4" },
                },
            },
            default_format_opts = {
                lsp_format = "fallback",
            },
        })
    end,
}
