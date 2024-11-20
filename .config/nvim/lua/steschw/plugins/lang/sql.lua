-- MasonInstall sqls

return {
    {
        "neovim/nvim-lspconfig",
        opts = function(_, opts)
            opts.servers.sqls = {}
        end,
    },
}
