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
		{ key = "d", mods = "CMD|SHIFT", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
		{ key = "h", mods = "CMD|SHIFT", action = act.ActivatePaneDirection("Left") },
		{ key = "l", mods = "CMD|SHIFT", action = act.ActivatePaneDirection("Right") },
		{ key = "j", mods = "CMD|SHIFT", action = act.ActivatePaneDirection("Down") },
		{ key = "k", mods = "CMD|SHIFT", action = act.ActivatePaneDirection("Up") },
		{ key = "=", mods = "CMD|SHIFT", action = act.AdjustPaneSize({ "Left", 10 }) },
		{ key = "-", mods = "CMD|SHIFT", action = act.AdjustPaneSize({ "Right", 10 }) },
		{ key = "w", mods = "CMD", action = act.CloseCurrentPane({ confirm = true }) },

		-- tabs
		{ key = "LeftArrow", mods = "CMD", action = act.MoveTabRelative(-1) },
		{ key = "RightArrow", mods = "CMD", action = act.MoveTabRelative(1) },
		{ key = "h", mods = "CMD", action = act.ActivateTabRelative(-1) },
		{ key = "l", mods = "CMD", action = act.ActivateTabRelative(1) },

		-- copy mode
		{ key = "y", mods = "CMD", action = act.ActivateCopyMode },

		-- scrolling
		{ key = "k", mods = "CMD", action = act.ScrollByLine(-1) },
		{ key = "j", mods = "CMD", action = act.ScrollByLine(1) },
		{ key = "k", mods = "CMD|CTRL", action = act.ScrollByPage(-0.5) },
		{ key = "j", mods = "CMD|CTRL", action = act.ScrollByPage(0.5) },

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

	local copy_mode = wezterm.gui.default_key_tables().copy_mode
	local copy_mode_keybinds = {
		{
			key = "p",
			mods = "CTRL",
			action = act.CopyMode({ MoveBackwardZoneOfType = "Output" }),
		},
		{
			key = "n",
			mods = "CTRL",
			action = act.CopyMode({ MoveForwardZoneOfType = "Output" }),
		},
		{
			key = "z",
			mods = "NONE",
			action = act.CopyMode({ SetSelectionMode = "SemanticZone" }),
		},
	}

	for _, keybind in ipairs(copy_mode_keybinds) do
		table.insert(copy_mode, keybind)
	end

	config.key_tables = {
		copy_mode = copy_mode,
	}
end

return M
