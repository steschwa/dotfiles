--- @class steschwa.ColorPalette
--- @field transparent string
--- @field titlebar_bg string
--- @field tabbar steschwa.ColorPaletteTabbar
--- @field right_status steschwa.ColorPaletteRightStatus

--- @class steschwa.ColorPaletteTabbar
--- @field inactive_fg string
--- @field active_fg string
--
--- @class steschwa.ColorPaletteRightStatus
--- @field fg string

-- local P = require("colors.nord")
local P = require("colors.rose-pine")

--- @type steschwa.ColorPalette
local M = {
	transparent = "rgba(0,0,0,0)",
	titlebar_bg = P.titlebar_bg,
	tabbar = P.tabbar,
	right_status = P.right_status,
}

return M
