local ls = require("luasnip")
local i = ls.insert_node
local f = ls.function_node
local fmta = require("luasnip.extras.fmt").fmta

local Fs = require("steschw.utils.fs")

return fmta(
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
