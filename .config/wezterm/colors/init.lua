--- @class steschwa.ColorPalette
--- @field transparent string
--- @field titlebar_bg string
--- @field tabbar steschwa.ColorPaletteTabbar

--- @class steschwa.ColorPaletteTabbar
--- @field inactive_bg string
--- @field inactive_fg string
--- @field active_bg string
--- @field active_fg string

local P = require("colors.nord")

--- @type steschwa.ColorPalette
local M = {
	transparent = "rgba(0,0,0,0)",
	titlebar_bg = P.titlebar_bg,
	tabbar = P.tabbar,
}

return M
