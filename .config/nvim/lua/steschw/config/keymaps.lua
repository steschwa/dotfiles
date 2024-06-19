-- :h key-notation

local keymap = require("steschw.utils.keys").keymap

keymap({ "n", "v" }, "`", "^")

keymap("n", "<C-u>", "<C-u>zz")
keymap("n", "<C-d>", "<C-d>zz")

-- clear search with <esc>
keymap({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>")
keymap("n", "<leader>n", "<cmd>noh<cr>")

-- better indenting
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

-- system clipboard helpers
keymap({ "n", "v" }, "<C-c>", '"+')

-- macros
keymap("n", "Q", "@q")

-- windows
keymap("n", "wl", "<C-w>v")
keymap("n", "wc", "<C-w>q")
keymap("n", "<C-h>", "<C-w>h")
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-k>", "<C-w>k")
keymap("n", "<C-l>", "<C-w>l")
keymap("n", "<C-=>", "<cmd>resize +2<cr>")
keymap("n", "<C-_>", "<cmd>resize -2<cr>")
keymap("n", "<C-.>", "<cmd>vertical resize +5<cr>")
keymap("n", "<C-,>", "<cmd>vertical resize -5<cr>")

-- leave insert on jk
keymap("i", "jk", "<esc>")

-- better paste
keymap("v", "p", '"_dP')

-- buffers
keymap("n", "<tab>", "<cmd>b#<cr>")

-- telescope
local telescope = require("telescope.builtin")
keymap("n", "<leader>p", telescope.find_files)
keymap("n", "<leader>f", telescope.live_grep)
keymap("n", "<leader>h", telescope.help_tags)
keymap("n", "<leader>b", telescope.buffers)
keymap("n", "<leader><leader>", telescope.pickers)

-- diagnostics
keymap("n", "[d", function()
    vim.diagnostic.goto_next({ float = false })
end)
keymap("n", "]d", function()
    vim.diagnostic.goto_prev({ float = false })
end)

-- formatting
keymap("n", "gs", function()
    require("steschw.utils.formatting").format_write()
end)

-- linting
keymap("n", "gl", function()
    vim.diagnostic.reset()
    require("steschw.utils.linting").lint()
end)

-- quickfix
keymap("n", "<leader>q", function()
    vim.cmd("botright cw")
end)
keymap("n", "[q", "<cmd>cnext<cr>")
keymap("n", "]q", "<cmd>cprevious<cr>")
keymap("n", "<C-q>", "<cmd>cclose<cr>")

-- misc
keymap("n", "<C-t>", function()
    vim.print(vim.bo.filetype)
end)
keymap("n", "<C-f>", function()
    local filepath = vim.fn.fnamemodify(vim.fn.expand("%"), ":p")
    vim.print(filepath)
    vim.fn.setreg("+", filepath)
end)
keymap("n", "<leader>l", "<cmd>Lazy<cr>")

keymap("n", "<leader>i", "<cmd>edit .ignore<cr>")
