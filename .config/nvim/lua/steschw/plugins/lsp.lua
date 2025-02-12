return {
    {
        "neovim/nvim-lspconfig",
        version = "*",
        event = "BufRead",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        },
        init = function()
            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(args)
                    local keymaps_lsp = require("steschw.config.keymaps_lsp")
                    keymaps_lsp.set(args.buf)
                end,
            })

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
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

            local server_options = {
                capabilities = capabilities,
            }

            local lspconfig = require("lspconfig")
            for server, config in pairs(opts.servers) do
                local final_opts = vim.tbl_deep_extend("force", config, server_options)
                lspconfig[server].setup(final_opts)
            end
        end,
    },
    {
        "williamboman/mason.nvim",
        cmd = "Mason",
        config = true,
    },
}
