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

-- search in visual
keymap("v", "/", "<esc>/\\%V")

-- system clipboard helpers
keymap({ "n", "v" }, "<C-c>", '"+')

-- macros
keymap("n", "Q", "@q")

-- windows
keymap("n", "wl", "<C-w>v")
keymap("n", "wc", "<C-w>q")
keymap("n", "wj", "<C-w><C-S>")
keymap("n", "wo", "<cmd>only<cr>")
keymap("n", "<C-h>", "<C-w>h")
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-k>", "<C-w>k")
keymap("n", "<C-l>", "<C-w>l")
keymap("n", "<C-=>", "<cmd>resize +2<cr>")
keymap("n", "<C-->", "<cmd>resize -2<cr>")
keymap("n", "<S-C-=>", "<cmd>vertical resize +4<cr>")
keymap("n", "<S-C-->", "<cmd>vertical resize -4<cr>")

-- leave insert on jk
keymap("i", "jk", "<esc>")

-- better paste
keymap("v", "p", '"_dP')

-- buffers
keymap("n", "<tab>", "<cmd>b#<cr>")
keymap("n", "<C-i>", "<C-i>")

-- formatting
keymap("n", "gs", function()
    require("steschw.utils.formatting").format()
    require("steschw.utils.linting").fix()
    pcall(vim.cmd.w)
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
keymap("n", "<C-q>", "<cmd>cclose<cr>")

-- options
keymap("n", "gw", function()
    ---@diagnostic disable-next-line: undefined-field
    vim.opt_local.wrap = not vim.opt_local.wrap:get()
end)

-- misc
keymap("n", "<C-t>", function()
    vim.print(vim.bo.filetype)
end)
keymap("n", "<C-f>", function()
    local filepath = vim.fn.fnamemodify(vim.fn.expand("%"), ":p")
    if vim.startswith(filepath, "oil://") then
        filepath = filepath:sub(#"oil://" + 1)
    end

    vim.print(filepath)
    vim.fn.setreg("+", filepath)
end)
keymap("n", "<leader>l", "<cmd>Lazy<cr>")

keymap("n", "<leader>i", function()
    local nvimignore_exists = vim.fn.filereadable(".nvimignore")
    if nvimignore_exists == 1 then
        vim.cmd("edit .nvimignore")
        return
    end

    vim.cmd("edit .ignore")
end)
keymap("n", "<leader>t", "<cmd>edit TODO.md<cr>")

keymap("n", "go", function()
    local filepath = vim.fn.fnamemodify(vim.fn.expand("%"), ":p")
    vim.system({ "open", "-R", filepath }, { detach = true })
end)
