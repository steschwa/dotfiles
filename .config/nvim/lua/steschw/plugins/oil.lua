return {
    "stevearc/oil.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    keys = {
        {
            "-",
            "<cmd>Oil<cr>",
        },
    },
    opts = {
        default_file_explorer = true,
        delete_to_trash = true,
        skip_confirm_for_simple_edits = true,
        use_default_keymaps = false,
    },
}
