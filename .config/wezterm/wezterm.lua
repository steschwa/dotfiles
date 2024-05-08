local wezterm = require("wezterm")

local config = wezterm.config_builder()

require("options").setup(config)
require("keybinds").setup(config)
require("mousebinds").setup(config)
require("ui.tabbar").setup()
require("ui.status").setup()

return config
