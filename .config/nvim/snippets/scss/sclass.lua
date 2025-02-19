local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local f = ls.function_node
local fmta = require("luasnip.extras.fmt").fmta

local Fs = require("steschw.utils.fs")
local Format = require("steschw.utils.format")

local snip = fmta(
    [[
.<F> {
    <>
}
]],
    {
        F = f(function()
            return Format.to_kebab_case(Fs.filename())
        end),
        i(0),
    }
)

return { s("sclass", snip) }
