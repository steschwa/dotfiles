local deps = require("steschw.utils.dependencies")

-- MasonInstall lua-language-server

return {
    {
        "folke/lazydev.nvim",
        ft = "lua",
        config = true,
    },
    {
        "neovim/nvim-lspconfig",
        opts = function(_, opts)
            opts.servers.lua_ls = {
                settings = {
                    Lua = {
                        runtime = {
                            version = "LuaJIT",
                        },
                    },
                },
            }
        end,
    },
    deps.formatter("stylua", { "lua" }),
}
