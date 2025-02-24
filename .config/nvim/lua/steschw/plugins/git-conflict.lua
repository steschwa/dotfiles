local keymaps = {
    { "n", "co", "<cmd>GitConflictChooseOurs<cr>" },
    { "n", "ct", "<cmd>GitConflictChooseTheirs<cr>" },
    { "n", "cb", "<cmd>GitConflictChooseBoth<cr>" },
    { "n", "]x", "<cmd>GitConflictNextConflict<cr>" },
    { "n", "[x", "<cmd>GitConflictPrevConflict<cr>" },
}

return {
    "akinsho/git-conflict.nvim",
    version = "*",
    event = "BufRead",
    init = function()
        vim.api.nvim_create_autocmd("User", {
            pattern = "GitConflictDetected",
            callback = function(event)
                vim.diagnostic.enable(false, { bufnr = event.buf })

                for _, def in ipairs(keymaps) do
                    vim.keymap.set(def[1], def[2], def[3], { buffer = event.buf })
                end
            end,
        })

        vim.api.nvim_create_autocmd("User", {
            pattern = "GitConflictResolved",
            callback = function(event)
                vim.diagnostic.enable(false, { bufnr = event.buf })

                for _, def in ipairs(keymaps) do
                    pcall(vim.keymap.del, def[1], def[2], { buffer = event.buf })
                end
            end,
        })
    end,
    opts = {
        default_mappings = false,
        disable_diagnostics = true,
    },
}
