return {
    "lewis6991/gitsigns.nvim",
    event = "BufRead",
    cmd = "Gitsigns",
    keys = {
        {
            "gp",
            "<cmd>Gitsigns preview_hunk<cr>",
        },
        {
            "]h",
            "<cmd>Gitsigns nav_hunk next --target=all<cr>",
        },
        {
            "[h",
            "<cmd>Gitsigns nav_hunk prev --target=all<cr>",
        },
    },
    opts = {
        signs = {
            add = { text = "▌" },
            change = { text = "▌" },
            delete = { text = "▌" },
            topdelete = { text = "▌" },
            changedelete = { text = "▌" },
            untracked = { text = "▌" },
        },
        signs_staged = {
            add = { text = "▌" },
            change = { text = "▌" },
            delete = { text = "▌" },
            topdelete = { text = "▌" },
            changedelete = { text = "▌" },
            untracked = { text = "▌" },
        },
        signs_staged_enable = true,
        preview_config = {
            row = 1,
            col = 0,
            border = "single",
        },
    },
}
