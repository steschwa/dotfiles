local ls = require("luasnip")
local i = ls.insert_node
local f = ls.function_node
local fmta = require("luasnip.extras.fmt").fmta

local Fs = require("steschw.utils.fs")
local Format = require("steschw.utils.format")

return fmta(
    [[
type <F>Return = {};

export function <>(): <F>Return {
    <>
}
]],
    {
        F = f(function()
            return Format.to_title_case(Fs.filename())
        end),
        f(Fs.filename),
        i(0),
    }
)
