local keymap = require("steschw.utils.keys").keymap

vim.wo.relativenumber = false
vim.wo.number = false

---@param from number
---@param to number
local function remove_range(from, to)
    local items = vim.fn.getqflist()

    local next_items = {}
    for i, item in ipairs(items) do
        if i < from or i > to then
            table.insert(next_items, item)
        end
    end

    vim.fn.setqflist(next_items, "r")
end

keymap("n", "dd", function()
    local line = vim.fn.line(".")
    remove_range(line, line)
end, { buffer = 0 })

keymap("v", "d", function()
    local v_from = vim.fn.line(".")
    local v_to = vim.fn.line("v")

    remove_range(math.min(v_from, v_to), math.max(v_from, v_to))

    vim.api.nvim_input("<esc>")
end, { buffer = 0 })
