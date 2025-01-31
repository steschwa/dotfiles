local keymap = require("steschw.utils.keys").keymap

keymap("n", "gb", function()
    vim.cmd.TexlabBuild()
    vim.cmd.TexlabForward()
end, { buffer = 0 })
