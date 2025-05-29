local keymap = require("steschw.utils.keys").keymap

keymap("n", "gb", "<cmd>LspTexlabBuild<cr>", { buffer = 0 })
keymap("n", "go", "<cmd>LspTexlabForward<cr>", { buffer = 0 })

vim.opt_local.formatoptions:append({
    -- insert comment on hitting 'o' in normal mode (new line)
    o = true,
    -- insert comment on hitting '<cr>' in insert mode (new line)
    r = true,
})
