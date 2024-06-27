-- MasonInstall marksman

return {
    {
        "neovim/nvim-lspconfig",
        opts = function(_, opts)
            opts.servers.marksman = {}
        end,
    },
}
