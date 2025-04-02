local ls = require("luasnip")
local s = ls.snippet

return {
    s("imp", require("steschw.snippets.typescript.import-statement")),
    s("log", require("steschw.snippets.typescript.console-log")),
    s("hook", require("steschw.snippets.typescript.react-hook")),

    s("scomp", require("steschw.snippets.react.component")),
    s("sclass", require("steschw.snippets.react.component-classname")),
    s("scss", require("steschw.snippets.react.component-scss")),
    s("sprops", require("steschw.snippets.react.component-props")),
}
