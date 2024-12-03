local keymap = require("steschw.utils.keys").keymap
local augroup = require("steschw.utils.autocmd").augroup

vim.api.nvim_create_autocmd("TextYankPost", {
    group = augroup("highlight_yank"),
    callback = function()
        vim.highlight.on_yank()
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    group = augroup("close_with_q"),
    pattern = {
        "help",
        "lspinfo",
        "qf",
        "DressingSelect",
        "vim",
        "lazy",
        "mason",
    },
    callback = function(event)
        vim.bo[event.buf].buflisted = false
        keymap("n", "q", "<cmd>close<cr>", { buffer = event.buf })
    end,
})

vim.api.nvim_create_autocmd({ "WinEnter", "BufWinEnter" }, {
    group = augroup("show_cursorline_active_win"),
    callback = function()
        vim.wo.cursorline = true
    end,
})
vim.api.nvim_create_autocmd("WinLeave", {
    group = augroup("hide_cursorline_inactive_win"),
    callback = function()
        vim.wo.cursorline = false
    end,
})

-- disable diagnostics if git conflicts are present
vim.api.nvim_create_autocmd("User", {
    group = augroup("git_conflict_detected"),
    pattern = "GitConflictDetected",
    callback = function()
        vim.diagnostic.enable(false)
    end,
})

-- enable diagnostics once all git conflicts are resolved
vim.api.nvim_create_autocmd("User", {
    group = augroup("git_conflict_resolved"),
    pattern = "GitConflictResolved",
    callback = function()
        vim.diagnostic.enable(true)
    end,
})
