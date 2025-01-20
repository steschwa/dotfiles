local keymap = require("steschw.utils.keys").keymap

keymap("n", "gb", "<cmd>TexlabBuild<cr>", { buffer = 0 })
keymap("n", "go", "<cmd>TexlabForward<cr>", { buffer = 0 })
