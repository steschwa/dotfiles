local wezterm = require("wezterm")
local act = wezterm.action

local M = {}

function M.setup(config)
	config.leader = { key = "p", mods = "CMD" }

	config.keys = {
		{
			key = "r",
			mods = "CMD",
			action = act.PromptInputLine({
				description = "Tab name",
				action = wezterm.action_callback(function(window, _, line)
					if line then
						window:active_tab():set_title(line)
					end
				end),
			}),
		},

		-- umlauts + special chars
		{ key = "u", mods = "OPT", action = act.SendString("ü") },
		{ key = "a", mods = "OPT", action = act.SendString("ä") },
		{ key = "o", mods = "OPT", action = act.SendString("ö") },
		{ key = "s", mods = "OPT", action = act.SendString("ß") },
		{ key = "u", mods = "SHIFT|OPT", action = act.SendString("Ü") },
		{ key = "a", mods = "SHIFT|OPT", action = act.SendString("Ä") },
		{ key = "o", mods = "SHIFT|OPT", action = act.SendString("Ö") },
		{ key = "e", mods = "OPT", action = act.SendString("€") },

		-- font size
		{ key = "-", mods = "CMD", action = act.DecreaseFontSize },
		{ key = "+", mods = "CMD", action = act.IncreaseFontSize },

		-- panes
		{ key = "d", mods = "CMD", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
		{ key = "n", mods = "CMD", action = act.ActivatePaneDirection("Left") },
		{ key = "p", mods = "CMD", action = act.ActivatePaneDirection("Right") },
		{ key = "=", mods = "CMD|SHIFT", action = act.AdjustPaneSize({ "Left", 10 }) },
		{ key = "-", mods = "CMD|SHIFT", action = act.AdjustPaneSize({ "Right", 10 }) },
		{ key = "w", mods = "CMD", action = act.CloseCurrentPane({ confirm = true }) },

		-- tabs
		{ key = "LeftArrow", mods = "CMD", action = act.MoveTabRelative(-1) },
		{ key = "RightArrow", mods = "CMD", action = act.MoveTabRelative(1) },
		{ key = "h", mods = "CMD|SHIFT", action = act.ActivateTabRelative(-1) },
		{ key = "l", mods = "CMD|SHIFT", action = act.ActivateTabRelative(1) },

		-- copy mode
		{ key = "c", mods = "LEADER", action = act.ActivateCopyMode },

		-- TODO: removeme once `config.disable_default_key_bindings = true` is used
		{
			key = "-",
			mods = "CTRL",
			action = act.DisableDefaultAssignment,
		},
		{
			key = "=",
			mods = "CTRL",
			action = act.DisableDefaultAssignment,
		},
	}
end

return M
