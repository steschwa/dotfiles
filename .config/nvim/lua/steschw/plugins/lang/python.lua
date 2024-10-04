-- MasonInstall pyright
-- MasonInstall ruff

return {
    {
        "neovim/nvim-lspconfig",
        opts = function(_, opts)
            opts.servers.pyright = {}
            opts.servers.ruff = {}
        end,
    },
}
