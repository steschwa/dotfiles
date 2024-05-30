local wezterm = require("wezterm")
local Palette = require("colors")

local M = {}

function M.setup(config)
	-- config.color_scheme = "nord"
	config.color_scheme = "rose-pine-moon"
	-- config.font = wezterm.font("JetBrainsMono Nerd Font")
	config.font = wezterm.font("Iosevka Nerd Font")
	config.font_size = 16

	config.default_prog = {
		"/opt/homebrew/bin/nu",
		"--config",
		"~/.config/nushell/config.nu",
		"--env-config",
		"~/.config/nushell/env.nu",
	}

	config.show_new_tab_button_in_tab_bar = false
	config.window_decorations = "RESIZE"
	config.window_padding = {
		left = 0,
		right = 0,
		top = "0.25cell",
		bottom = 0,
	}

	config.window_frame = {
		active_titlebar_bg = Palette.titlebar_bg,
		inactive_titlebar_bg = Palette.titlebar_bg,
	}

	config.colors = {
		-- rose-pine moon muted
		selection_bg = "#6e6a86",
		-- rose-pine moon text
		selection_fg = "#e0def4",
		tab_bar = {
			background = "rgba(0,0,0,0)",
		},
	}
	config.use_fancy_tab_bar = false
	config.tab_bar_at_bottom = true
	config.hide_tab_bar_if_only_one_tab = false
	config.tab_max_width = 32

	-- config.disable_default_key_bindings = true
	config.disable_default_mouse_bindings = true
end

return M
