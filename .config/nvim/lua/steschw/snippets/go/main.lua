local ls = require("luasnip")
local i = ls.insert_node
local fmta = require("luasnip.extras.fmt").fmta

return fmta(
    [[
package main

func main() {
    <>    
}
]],
    {
        i(0),
    }
)
