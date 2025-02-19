local ls = require("luasnip")
local s = ls.snippet

return {
    s("main", require("steschw.snippets.go.main")),
}
