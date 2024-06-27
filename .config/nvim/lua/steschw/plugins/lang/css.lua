local deps = require("steschw.utils.dependencies")

-- MasonInstall css-lsp
-- MasonInstall tailwindcss-language-server
-- MasonInstall prettierd

return {
    {
        "neovim/nvim-lspconfig",
        opts = function(_, opts)
            opts.servers.cssls = {}
            opts.servers.tailwindcss = {}
        end,
    },
    deps.formatter("prettierd", { "css", "scss" }),
}
