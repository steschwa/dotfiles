-- MasonInstall yamlls

return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "b0o/schemastore.nvim",
        },
        opts = function(_, opts)
            opts.servers.yamlls = {
                filetypes = { "yaml", "yaml.docker-compose", "yaml.github-action" },
                settings = {
                    yaml = {
                        schemaStore = { enable = false, url = "" },
                        schemas = require("schemastore").yaml.schemas(),
                    },
                },
            }
        end,
    },
}
