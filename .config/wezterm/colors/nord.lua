local Nord = {}

Nord.palette = {
	polar_night = {
		nord0 = "#2e3440",
		nord1 = "#3B4252",
		nord2 = "#434C5E",
		nord3 = "#4C566A",
	},
	snow_storm = {
		nord4 = "#D8DEE9",
		nord5 = "#E5E9F0",
		nord6 = "#ECEFF4",
	},
	frost = {
		nord7 = "#8FBCBB",
		nord8 = "#88C0D0",
		nord9 = "#81A1C1",
		nord10 = "#5E81AC",
	},
	aurora = {
		nord11 = "#BF616A",
		nord12 = "#D08770",
		nord13 = "#EBCB8B",
		nord14 = "#A3BE8C",
		nord15 = "#B48EAD",
	},
}

Nord.titlebar_bg = Nord.palette.polar_night.nord0

--- @type steschwa.ColorPaletteTabbar
Nord.tabbar = {
	inactive_bg = Nord.palette.polar_night.nord1,
	inactive_fg = Nord.palette.snow_storm.nord4,
	active_bg = Nord.palette.aurora.nord15,
	active_fg = Nord.palette.polar_night.nord0,
}

--- @type steschwa.ColorPaletteRightStatus
Nord.right_status = {
	bg = Nord.palette.aurora.nord13,
	fg = Nord.palette.polar_night.nord0,
}

return Nord
