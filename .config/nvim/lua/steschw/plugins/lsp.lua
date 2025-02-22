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

            local handlers = { "textDocument/hover", "textDocument/signatureHelp" }
            for _, handler in pairs(handlers) do
                vim.lsp.handlers[handler] = vim.lsp.with(vim.lsp.handlers[handler], {
                    border = "single",
                })
            end

            -- always jump to first definition
            vim.lsp.handlers["textDocument/definition"] = function(_, result)
                if not result or vim.tbl_isempty(result) then
                    vim.notify("[LSP] Could not find definition", vim.log.levels.INFO)
                    return
                end

                local item = result
                if type(result) == "table" and #result > 0 then
                    item = result[1]
                end

                if item ~= nil then
                    vim.lsp.util.jump_to_location(item, "utf-8")
                end
            end
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
