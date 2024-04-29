local wezterm = require("wezterm")

local config = wezterm.config_builder()

require("options").setup(config)
require("keybinds").setup(config)
require("mousebinds").setup(config)
require("tabbar").setup()

return config
