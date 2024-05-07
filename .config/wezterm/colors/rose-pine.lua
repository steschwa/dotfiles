local RosePine = {}

RosePine.palette = {
	base = "#191724",
	surface = "#1f1d2e",
	overlay = "#26233a",
	muted = "#6e6a86",
	subtle = "#908caa",
	text = "#e0def4",
	love = "#eb6f92",
	gold = "#f6c177",
	rose = "#ebbcba",
	pine = "#31748f",
	foam = "#9ccfd8",
	iris = "#c4a7e7",
	highlight_low = "#21202e",
	highlight_med = "#403d52",
	highlight_high = "#524f67",
}

RosePine.titlebar_bg = RosePine.palette.base

--- @type steschwa.ColorPaletteTabbar
RosePine.tabbar = {
	inactive_bg = RosePine.palette.overlay,
	inactive_fg = RosePine.palette.subtle,
	active_bg = RosePine.palette.muted,
	active_fg = RosePine.palette.text,
}

return RosePine
