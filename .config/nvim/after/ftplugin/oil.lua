local keymap = require("steschw.utils.keys").keymap

local act = require("oil.actions")

local keymap_opts = { buffer = 0 }

keymap("n", "<cr>", act.select.callback, keymap_opts)
keymap("n", "<C-s>", act.select_vsplit.callback, keymap_opts)
keymap("n", "q", act.close.callback, keymap_opts)
keymap("n", "-", act.parent.callback, keymap_opts)
keymap("n", "^", act.open_cwd.callback, keymap_opts)
keymap("n", "g.", act.toggle_hidden.callback, keymap_opts)
keymap("n", "<C-r>", act.refresh.callback, keymap_opts)
keymap("n", "<C-p>", act.preview.callback, keymap_opts)

keymap("n", "==", function()
    local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)

    local line_width = 1
    for _, line in ipairs(lines) do
        line_width = math.max(line_width, vim.fn.strdisplaywidth(line))
    end

    line_width = math.max(line_width, 40)

    vim.api.nvim_win_set_width(0, line_width + 1)
end, keymap_opts)
