local wezterm = require("wezterm")
local act = wezterm.action

local M = {}

function M.setup(config)
	config.leader = { key = "p", mods = "CMD" }

	-- what do i need?
	-- 1. create tab: ctrl+t
	-- 2. switch tab cmd+[1-9]
	-- 3. search cmd+f
	-- 3.1 jump to next match ctrl+j
	-- 3.2 jump to previous match ctrl+k
	-- 3.3 clear search ctrl+w
	-- 3.4 cancel search cmd+f / escape
	-- 4. copy mode https://wezfurlong.org/wezterm/copymode.html#key-assignments

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

		-- font size
		{
			key = "-",
			mods = "CMD",
			action = act.DecreaseFontSize,
		},
		{
			key = "+",
			mods = "CMD",
			action = act.IncreaseFontSize,
		},

		-- panes
		{
			key = "d",
			mods = "CMD",
			action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
		},
		{
			key = "[",
			mods = "CMD",
			action = act.ActivatePaneDirection("Left"),
		},
		{
			key = "]",
			mods = "CMD",
			action = act.ActivatePaneDirection("Right"),
		},
		{
			key = "=",
			mods = "CMD|SHIFT",
			action = act.AdjustPaneSize({ "Left", 10 }),
		},
		{
			key = "-",
			mods = "CMD|SHIFT",
			action = act.AdjustPaneSize({ "Right", 10 }),
		},

		-- tabs
		{
			key = "LeftArrow",
			mods = "CMD",
			action = act.MoveTabRelative(-1),
		},
		{
			key = "RightArrow",
			mods = "CMD",
			action = act.MoveTabRelative(1),
		},
		{
			key = "h",
			mods = "CMD|SHIFT",
			action = act.ActivateTabRelative(-1),
		},
		{
			key = "l",
			mods = "CMD|SHIFT",
			action = act.ActivateTabRelative(1),
		},

		-- copy mode
		{
			key = "c",
			mods = "LEADER",
			action = act.ActivateCopyMode,
		},

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
