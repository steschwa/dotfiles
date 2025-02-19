local ls = require("luasnip")
local s = ls.snippet

return {
    s("sclass", require("steschw.snippets.css.class-from-filename")),
}
