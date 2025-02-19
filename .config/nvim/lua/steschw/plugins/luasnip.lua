return {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    lazy = true,
    config = function()
        require("luasnip").setup()
        require("luasnip.loaders.from_lua").load({
            paths = { "~/.config/nvim/snippets" },
        })
    end,
}
