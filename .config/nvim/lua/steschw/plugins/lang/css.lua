-- MasonInstall css-lsp
-- MasonInstall tailwindcss-language-server

return {
    {
        "neovim/nvim-lspconfig",
        opts = function(_, opts)
            opts.servers.cssls = {}
            opts.servers.tailwindcss = {}
        end,
    },
}
