local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local f = ls.function_node
local fmta = require("luasnip.extras.fmt").fmta

local Fs = require("steschw.utils.fs")

local snip = fmta(
    [[
type <F>Props = {
    <>
};
]],
    {
        F = f(Fs.filename),
        i(0),
    }
)

return { s("sprops", snip) }
