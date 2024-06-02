local deps = require("steschw.utils.dependencies")

return {
    {
        "folke/lazydev.nvim",
        ft = "lua",
        config = true,
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            deps.mason("lua-language-server"),
        },
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
