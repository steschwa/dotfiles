local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmta = require("luasnip.extras.fmt").fmta

local snip = fmta("console.log(<>)", {
    i(0),
})

return { s("log", snip) }
