-- MasonInstall graphql-language-service-cli

return {
    {
        "neovim/nvim-lspconfig",
        opts = function(_, opts)
            opts.servers.graphql = {}
        end,
    },
}
