-- MasonInstall bibtex-tidy
-- MasonInstall biome
-- MasonInstall goimports
-- MasonInstall prettierd
-- MasonInstall ruff
-- MasonInstall sqruff
-- MasonInstall stylua
-- MasonInstall taplo
-- MasonInstall tex-fmt

return {
    "stevearc/conform.nvim",
    lazy = true,
    config = function()
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
                scss = { "prettierd" },
                sql = { "sqruff" },
                tex = { "tex-fmt" },
                toml = { "taplo" },
                typescript = { "biome-check", "prettierd", stop_after_first = true },
                typescriptreact = { "biome-check", "prettierd", stop_after_first = true },
                yaml = { "prettierd" },
                d2 = { "d2" },
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
            },
            default_format_opts = {
                lsp_format = "fallback",
            },
        })
    end,
}
