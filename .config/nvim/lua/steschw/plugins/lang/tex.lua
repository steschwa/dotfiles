-- MasonInstall texlab

return {
    {
        "neovim/nvim-lspconfig",
        opts = function(_, opts)
            opts.servers.texlab = {}
        end,
    },
}