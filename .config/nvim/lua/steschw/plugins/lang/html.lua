local deps = require("steschw.utils.dependencies")

return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            deps.mason("html-lsp"),
        },
        opts = function(_, opts)
            opts.servers.html = {}
        end,
    },
    deps.formatter("prettierd", { "html" }),
}
