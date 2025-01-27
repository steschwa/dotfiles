return {
    "akinsho/git-conflict.nvim",
    version = "*",
    init = function()
        -- disable diagnostics if git conflicts are present
        vim.api.nvim_create_autocmd("User", {
            pattern = "GitConflictDetected",
            callback = function(event)
                vim.diagnostic.enable(false)

                local opts = { buffer = event.buf }

                vim.keymap.set("n", "co", "<cmd>GitConflictChooseOurs<cr>", opts)
                vim.keymap.set("n", "ct", "<cmd>GitConflictChooseTheirs<cr>", opts)
                vim.keymap.set("n", "cb", "<cmd>GitConflictChooseBoth<cr>", opts)
                vim.keymap.set("n", "]x", "<cmd>GitConflictNextConflict<cr>", opts)
                vim.keymap.set("n", "[x", "<cmd>GitConflictPrevConflict<cr>", opts)
            end,
        })

        -- enable diagnostics once all git conflicts are resolved
        vim.api.nvim_create_autocmd("User", {
            pattern = "GitConflictResolved",
            callback = function()
                vim.diagnostic.enable(true)
            end,
        })
    end,
    opts = {
        default_mappings = false,
        disable_diagnostics = true,
    },
}
