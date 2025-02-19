return {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    lazy = true,
    config = function()
        local ls = require("luasnip")
        ls.setup()

        ls.add_snippets("typescriptreact", require("steschw.plugins.snippets.typescriptreact"))
        ls.add_snippets("typescript", require("steschw.plugins.snippets.typescript"))
        ls.add_snippets("scss", require("steschw.plugins.snippets.scss"))
        ls.add_snippets("html", require("steschw.plugins.snippets.html"))
        ls.add_snippets("go", require("steschw.plugins.snippets.go"))
    end,
}
