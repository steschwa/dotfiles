local keymap = require("steschw.utils.keys").keymap

keymap("n", "?", function()
    local word_under_cursor = vim.fn.expand("<cword>")

    local ok = pcall(vim.cmd.h, word_under_cursor)
    if not ok then
        vim.print("no help entry for " .. word_under_cursor)
    end
end, {
    buffer = 0,
})
