local wezterm = require("wezterm")
local act = wezterm.action

local M = {}

function M.setup(config)
	config.mouse_bindings = {
		-- select
		{
			event = { Down = { streak = 1, button = "Left" } },
			mods = "NONE",
			action = act.SelectTextAtMouseCursor("Cell"),
		},
		{
			event = { Drag = { streak = 1, button = "Left" } },
			mods = "NONE",
			action = act.ExtendSelectionToMouseCursor("Cell"),
		},
		{
			event = { Down = { streak = 1, button = "Left" } },
			mods = "SHIFT",
			action = act.ExtendSelectionToMouseCursor("Cell"),
		},
		-- select word
		{
			event = { Down = { streak = 2, button = "Left" } },
			mods = "NONE",
			action = act.SelectTextAtMouseCursor("Word"),
		},
		-- select line
		{
			event = { Down = { streak = 3, button = "Left" } },
			mods = "NONE",
			action = act.SelectTextAtMouseCursor("Line"),
		},
		-- open link
		{
			event = { Up = { streak = 1, button = "Left" } },
			mods = "CMD",
			action = act.OpenLinkAtMouseCursor,
		},
		-- scroll
		{
			event = { Down = { streak = 1, button = { WheelUp = 1 } } },
			mods = "NONE",
			action = act.ScrollByCurrentEventWheelDelta,
		},
		{
			event = { Down = { streak = 1, button = { WheelDown = 1 } } },
			mods = "NONE",
			action = act.ScrollByCurrentEventWheelDelta,
		},
	}
end

return M
