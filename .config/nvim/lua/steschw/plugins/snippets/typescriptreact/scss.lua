local ls = require("luasnip")
local s = ls.snippet
local f = ls.function_node
local fmta = require("luasnip.extras.fmt").fmta

local Fs = require("steschw.plugins.snippets.fs")

local snip = fmta('import "./<CSSFilename>.scss";', {
    CSSFilename = f(function()
        local filename = Fs.filename()

        return filename:sub(1, 1):lower() .. filename:sub(2)
    end),
})

return s("scss", snip)
