local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmta = require("luasnip.extras.fmt").fmta

local snip = fmta(
    [[
import { <> } from "<>"
]],
    {
        i(0),
        i(1),
    }
)

return s("simp", snip)
