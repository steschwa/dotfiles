-- MasonInstall gopls

return {
    {
        "neovim/nvim-lspconfig",
        opts = function(_, opts)
            opts.servers.gopls = {}
        end,
    },
}
