local M = {}

---@param name string
---@param opts vim.lsp.ClientConfig
function M.setup_server(name, opts)
    local server_options = {
        capabilities = require("blink.cmp").get_lsp_capabilities(opts.capabilities),
        on_attach = function(client, bufnr)
            require("steschw.config.keymaps_lsp").set(bufnr)

            if opts.on_attach ~= nil then
                opts.on_attach(client, bufnr)
            end
        end,
    }

    local final_opts = vim.tbl_deep_extend("force", opts, server_options)
    require("lspconfig")[name].setup(final_opts)
end

return M
