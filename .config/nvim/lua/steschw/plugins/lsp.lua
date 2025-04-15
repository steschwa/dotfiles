local LspUtils = require("steschw.utils.lsp")
local Diagnostics = require("steschw.utils.diagnostics")

return {
    {
        "neovim/nvim-lspconfig",
        version = "*",
        event = { "BufRead", "BufNewFile" },
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "saghen/blink.cmp",
        },
        init = function()
            vim.diagnostic.config({
                virtual_text = true,
                update_in_insert = false,
                severity_sort = true,
                float = {
                    focusable = true,
                    style = "minimal",
                    border = "rounded",
                    source = true,
                    header = "",
                },
                signs = {
                    text = Diagnostics.get_signs(),
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
