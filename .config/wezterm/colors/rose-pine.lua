local RosePine = {}

RosePine.palette = {
	base = "#232136",
	surface = "#2a273f",
	overlay = "#393552",
	muted = "#6e6a86",
	subtle = "#908caa",
	text = "#e0def4",
	love = "#eb6f92",
	gold = "#f6c177",
	rose = "#ea9a97",
	pine = "#3e8fb0",
	foam = "#9ccfd8",
	iris = "#c4a7e7",
	highlight_low = "#2a283e",
	highlight_med = "#44415a",
	highlight_high = "#56526e",
}

RosePine.titlebar_bg = RosePine.palette.base

--- @type steschwa.ColorPaletteTabbar
RosePine.tabbar = {
	inactive_bg = RosePine.palette.overlay,
	inactive_fg = RosePine.palette.subtle,
	active_bg = RosePine.palette.subtle,
	active_fg = RosePine.palette.highlight_low,
}

--- @type steschwa.ColorPaletteRightStatus
RosePine.right_status = {
	bg = RosePine.palette.gold,
	fg = RosePine.palette.highlight_low,
}

return RosePine
