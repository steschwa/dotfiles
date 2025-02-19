local ls = require("luasnip")
local f = ls.function_node
local fmta = require("luasnip.extras.fmt").fmta

local Fs = require("steschw.utils.fs")

return fmta('import "./<CSSFilename>.scss";', {
    CSSFilename = f(function()
        local filename = Fs.filename()

        return filename:sub(1, 1):lower() .. filename:sub(2)
    end),
})
