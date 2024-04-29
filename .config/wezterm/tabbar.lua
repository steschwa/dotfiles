local wezterm = require("wezterm")
local palette = require("colors")

local TAB_ICON = ""

--- @return string
local function tab_title(tab)
	local title = tab.tab_title
	if title and #title > 0 then
		return title
	end

	return tab.active_pane.title
end

local M = {}

function M.setup()
	wezterm.on("format-tab-title", function(tab, _, panes, _, hover)
		local title = tab_title(tab)

		local bg = palette.polar_night.nord1
		local fg = palette.snow_storm.nord4

		if tab.is_active then
			bg = palette.aurora.nord15
			fg = palette.polar_night.nord0
		end

		local items = {}

		if tab.tab_index > 0 then
			table.insert(items, { Background = { Color = bg } })
			table.insert(items, { Foreground = { Color = palette.polar_night.nord0 } })
			table.insert(items, { Text = TAB_ICON })
		end

		if hover then
			table.insert(items, { Attribute = { Intensity = "Bold" } })
			table.insert(items, { Attribute = { Italic = false } })
		end

		table.insert(items, { Background = { Color = bg } })
		table.insert(items, { Foreground = { Color = fg } })
		table.insert(items, { Text = string.format(" %d %s ", tab.tab_index + 1, title) })

		if tab.is_active and #panes > 1 then
			local panes_text = ""
			for _, pane in ipairs(panes) do
				panes_text = panes_text .. (pane.is_active and "" or "")
			end

			table.insert(items, { Text = panes_text })
		end

		table.insert(items, { Background = { Color = palette.transparent } })
		table.insert(items, { Foreground = { Color = bg } })
		table.insert(items, { Text = TAB_ICON })

		return items
	end)
end

return M
