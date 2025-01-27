return {
    "akinsho/git-conflict.nvim",
    version = "*",
    event = { "BufReadPre", "BufNewFile" },
    init = function()
        vim.api.nvim_create_autocmd("User", {
            pattern = "GitConflictDetected",
            callback = function(event)
                vim.diagnostic.enable(false, { bufnr = event.buf })

                local opts = { buffer = event.buf }

                vim.keymap.set("n", "co", "<cmd>GitConflictChooseOurs<cr>", opts)
                vim.keymap.set("n", "ct", "<cmd>GitConflictChooseTheirs<cr>", opts)
                vim.keymap.set("n", "cb", "<cmd>GitConflictChooseBoth<cr>", opts)
                vim.keymap.set("n", "]x", "<cmd>GitConflictNextConflict<cr>", opts)
                vim.keymap.set("n", "[x", "<cmd>GitConflictPrevConflict<cr>", opts)
            end,
        })

        vim.api.nvim_create_autocmd("User", {
            pattern = "GitConflictResolved",
            callback = function(event)
                vim.diagnostic.enable(false, { bufnr = event.buf })
            end,
        })
    end,
    opts = {
        default_mappings = false,
        disable_diagnostics = true,
    },
}
