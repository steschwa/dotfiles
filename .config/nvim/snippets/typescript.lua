local ls = require("luasnip")
local s = ls.snippet

return {
    s("imp", require("steschw.snippets.typescript.import-statement")),
    s("log", require("steschw.snippets.typescript.console-log")),
    s("hook", require("steschw.snippets.typescript.react-hook")),
}
