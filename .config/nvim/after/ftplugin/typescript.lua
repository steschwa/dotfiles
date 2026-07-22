local editing = require("steschw.utils.editing")
local keymap = require("steschw.utils.keys").keymap

local function insert_log()
    local text = editing.get_cursor_text()
    editing.insert_after_cursor(
        string.format('%sconsole.log("%s:", %s);', editing.get_indentation(), text, text)
    )
    vim.cmd("normal! <esc>")
end

keymap("n", "gl", insert_log, { buffer = 0 })
keymap("v", "gl", insert_log, { buffer = 0 })
