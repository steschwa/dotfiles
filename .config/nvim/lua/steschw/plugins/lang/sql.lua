-- MasonInstall postgrestools

return {
    {
        "neovim/nvim-lspconfig",
        opts = function(_, opts)
            opts.servers.postgres_lsp = {}
        end,
    },
}
