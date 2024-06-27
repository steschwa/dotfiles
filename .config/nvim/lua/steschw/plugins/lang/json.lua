local deps = require("steschw.utils.dependencies")

-- MasonInstall json-lsp

return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "b0o/schemastore.nvim",
        },
        opts = function(_, opts)
            opts.servers.jsonls = {
                settings = {
                    json = {
                        schemas = require("schemastore").json.schemas(),
                        validate = { enable = true },
                    },
                },
            }
        end,
    },
    deps.formatter("prettierd", { "json", "jsonc" }),
}
