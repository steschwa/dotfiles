local wezterm = require("wezterm")
local Palette = require("colors")

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
	wezterm.on("format-tab-title", function(tab, _, _, _, hover)
		local bg = Palette.tabbar.inactive_bg
		local fg = Palette.tabbar.inactive_fg

		local mux_tab = wezterm.mux.get_tab(tab.tab_id)
		local panes = mux_tab:panes_with_info()

		if tab.is_active then
			bg = Palette.tabbar.active_bg
			fg = Palette.tabbar.active_fg
		end

		local items = {}

		if tab.tab_index > 0 then
			table.insert(items, { Background = { Color = bg } })
			table.insert(items, { Foreground = { Color = Palette.titlebar_bg } })
			table.insert(items, { Text = TAB_ICON })
		end

		if hover then
			table.insert(items, { Attribute = { Intensity = "Bold" } })
		end

		table.insert(items, { Background = { Color = bg } })
		table.insert(items, { Foreground = { Color = fg } })
		table.insert(items, { Text = string.format(" %d %s ", tab.tab_index + 1, tab_title(tab)) })

		if #panes > 1 then
			local panes_status_chars = {}
			for _, pane in ipairs(panes) do
				table.insert(panes_status_chars, (pane.is_active and "" or ""))
			end

			local panes_text = table.concat(panes_status_chars, "")

			table.insert(items, { Text = panes_text })
		end

		table.insert(items, { Background = { Color = "rgba(0,0,0,0)" } })
		table.insert(items, { Foreground = { Color = bg } })
		table.insert(items, { Text = TAB_ICON })

		return items
	end)
end

return M
