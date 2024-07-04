-- MasonInstall eslint-lsp

return {
    {
        "neovim/nvim-lspconfig",
        opts = function(_, opts)
            opts.servers.eslint = {}
        end,
    },
}
