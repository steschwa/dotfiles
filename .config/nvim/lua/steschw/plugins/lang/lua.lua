-- MasonInstall lua-language-server

return {
    {
        "neovim/nvim-lspconfig",
        opts = function(_, opts)
            opts.servers.lua_ls = {}
        end,
    },
    {
        "folke/lazydev.nvim",
        ft = "lua",
        config = true,
    },
}
