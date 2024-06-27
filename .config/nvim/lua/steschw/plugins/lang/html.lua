-- MasonInstall html-lsp

return {
    {
        "neovim/nvim-lspconfig",
        opts = function(_, opts)
            opts.servers.html = {}
        end,
    },
}
