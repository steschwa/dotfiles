local deps = require("steschw.utils.dependencies")

-- MasonInstall gopls

return {
    {
        "neovim/nvim-lspconfig",
        opts = function(_, opts)
            opts.servers.gopls = {}
        end,
    },
    deps.formatter("goimports", { "go" }),
    deps.linter("revive", { "go" }),
}
