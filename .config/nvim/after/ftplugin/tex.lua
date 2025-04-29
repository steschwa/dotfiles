local keymap = require("steschw.utils.keys").keymap

keymap("n", "gb", "<cmd>LspTexlabBuild<cr>", { buffer = 0 })
keymap("n", "go", "<cmd>LspTexlabForward<cr>", { buffer = 0 })
