local sign = "▎"

return {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    keys = {
        { "gb", "<cmd>Gitsigns blame_line<cr>" },
        { "gp", "<cmd>Gitsigns preview_hunk<cr>" },
        { "]g", "<cmd>Gitsigns next_hunk<cr>" },
        { "[g", "<cmd>Gitsigns prev_hunk<cr>" },
    },
    opts = {
        signs = {
            add = { text = sign },
            change = { text = sign },
            delete = { text = sign },
            topdelete = { text = sign },
            changedelete = { text = sign },
            untracked = { text = sign },
        },
        signs_staged_enable = false,
        update_debounce = 1000,
        current_line_blame = false,
    },
}
