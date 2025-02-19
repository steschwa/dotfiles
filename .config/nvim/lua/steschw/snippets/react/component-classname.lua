local ls = require("luasnip")
local f = ls.function_node

local Fs = require("steschw.utils.fs")
local Format = require("steschw.utils.format")

return {
    f(function()
        return Format.to_kebab_case(Fs.filename())
    end),
}
