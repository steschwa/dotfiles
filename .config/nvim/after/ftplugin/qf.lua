local keymap = require("steschw.utils.keys").keymap

vim.wo.relativenumber = false
vim.wo.number = false

keymap("n", "dd", function()
    local list = vim.fn.getqflist()
    if #list == 0 then
        return
    end

    local line_idx = vim.fn.line(".")
    local col_idx = vim.fn.col(".") - 1
    if line_idx < 1 or line_idx > #list then
        return
    end

    table.remove(list, line_idx)
    vim.fn.setqflist(list, "r")

    if #list == 0 then
        vim.cmd("cclose")
    else
        local next_line_idx = math.min(line_idx, #list)
        vim.api.nvim_win_set_cursor(0, { next_line_idx, col_idx })
    end
end, { buffer = 0 })
