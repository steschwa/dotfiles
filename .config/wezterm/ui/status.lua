local wezterm = require("wezterm")
local Palette = require("colors")

local M = {}

function M.setup()
	wezterm.on("update-right-status", function(window, _)
		local name = window:active_key_table()
		if not name then
			window:set_right_status("")
			return
		end

		local items = {}

		table.insert(items, { Foreground = { Color = Palette.right_status.fg } })
		table.insert(items, { Text = string.format("   %s ", name) })

		window:set_right_status(wezterm.format(items))
	end)
end

return M
