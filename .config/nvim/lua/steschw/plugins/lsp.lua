local LspUtils = require("steschw.utils.lsp")

return {
    {
        "neovim/nvim-lspconfig",
        version = "*",
        event = "BufRead",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "saghen/blink.cmp",
        },
        init = function()
            local signs = {
                { name = "DiagnosticSignError", text = "E", texthl = "DiagnosticSignError" },
                { name = "DiagnosticSignWarn", text = "W", texthl = "DiagnosticSignWarn" },
                { name = "DiagnosticSignInfo", text = "I", texthl = "DiagnosticSignInfo" },
                { name = "DiagnosticSignHint", text = "H", texthl = "DiagnosticSignHint" },
            }
            for _, sign in ipairs(signs) do
                vim.fn.sign_define(sign.name, sign)
            end

            vim.diagnostic.config({
                virtual_text = {
                    prefix = "",
                },
                update_in_insert = false,
                underline = true,
                severity_sort = true,
                float = {
                    focusable = true,
                    style = "minimal",
                    border = "rounded",
                    source = true,
                    header = "",
                },
            })
        end,
        opts = {
            servers = {},
        },
        config = function(_, opts)
            for server, config in pairs(opts.servers) do
                LspUtils.setup_server(server, config)
            end
        end,
    },
    {
        "williamboman/mason.nvim",
        cmd = "Mason",
        config = true,
    },
}
