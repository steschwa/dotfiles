local deps = require("steschw.utils.dependencies")

-- MasonInstall marksman

return {
    {
        "neovim/nvim-lspconfig",
        opts = function(_, opts)
            opts.servers.marksman = {}
        end,
    },
    deps.formatter("prettierd", { "markdown" }),
}
