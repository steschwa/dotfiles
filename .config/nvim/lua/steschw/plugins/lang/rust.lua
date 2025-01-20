-- MasonInstall rust-analyzer

return {
    {
        "neovim/nvim-lspconfig",
        opts = function(_, opts)
            opts.servers.rust_analyzer = {}
        end,
    },
}
