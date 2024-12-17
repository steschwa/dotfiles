local keymap = require("steschw.utils.keys").keymap

local act = require("oil.actions")

local keymap_opts = { buffer = 0 }

keymap("n", "<cr>", act.select.callback, keymap_opts)
keymap("n", "q", act.close.callback, keymap_opts)
keymap("n", "<esc>", act.close.callback, keymap_opts)
keymap("n", "-", act.parent.callback, keymap_opts)
keymap("n", "^", act.open_cwd.callback, keymap_opts)
keymap("n", "g.", act.toggle_hidden.callback, keymap_opts)
keymap("n", "<C-r>", act.refresh.callback, keymap_opts)
