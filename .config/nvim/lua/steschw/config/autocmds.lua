local keymap = require("steschw.utils.keys").keymap

vim.api.nvim_create_autocmd("User", {
    pattern = "LazyCheck",
    callback = function()
        vim.cmd("redrawstatus!")
    end,
})

vim.api.nvim_create_autocmd("DiagnosticChanged", {
    callback = function()
        vim.cmd("redrawstatus!")
    end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = {
        "help",
        "lspinfo",
        "qf",
        "vim",
        "lazy",
        "mason",
        "GitBlame",
    },
    callback = function(event)
        vim.bo[event.buf].buflisted = false
        keymap("n", "q", "<cmd>close<cr>", { buffer = event.buf })
    end,
})

vim.api.nvim_create_autocmd({ "WinEnter", "BufWinEnter" }, {
    callback = function()
        vim.wo.cursorline = true
    end,
})
vim.api.nvim_create_autocmd("WinLeave", {
    callback = function()
        vim.wo.cursorline = false
    end,
})

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(event)
        require("steschw.config.keymaps_lsp").set(event.buf)
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    callback = function()
        pcall(vim.treesitter.start)
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end,
})
