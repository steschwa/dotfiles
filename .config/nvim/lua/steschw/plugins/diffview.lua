return {
    dir = "/tmp/diffview.nvim",
    -- "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewFileHistory" },
    keys = {
        { "<leader>gc", "<cmd>DiffviewClose<cr>" },
        { "<leader>gh", "<cmd>DiffviewFileHistory %<cr>" },
    },
    config = function()
        local actions = require("diffview.actions")

        require("diffview").setup({
            enhanced_diff_hl = true,
            show_help_hints = false,
            view = {
                default = {
                    disable_diagnostics = true,
                    winbar_info = false,
                },
                merge_tool = {
                    --- @see diffview-config-view.x.layout
                    layout = "diff3_mixed",
                    disable_diagnostics = true,
                    winbar_info = false,
                },
                file_history = {
                    disable_diagnostics = true,
                    winbar_info = false,
                },
            },
            file_panel = {
                listing_style = "list",
                win_config = {
                    position = "bottom",
                    height = 15,
                },
            },
            file_history_panel = {
                log_options = {
                    git = {
                        single_file = {
                            all = true,
                            follow = true,
                            max_count = 1024,
                        },
                    },
                },
                win_config = {
                    position = "bottom",
                    height = 15,
                },
            },
            keymaps = {
                disable_defaults = true,
                view = {
                    { "n", "<tab>", actions.select_next_entry },
                    { "n", "<s-tab>", actions.select_prev_entry },
                    { "n", "[x", actions.prev_conflict },
                    { "n", "]x", actions.next_conflict },
                    { "n", "co", actions.conflict_choose("ours") },
                    { "n", "ct", actions.conflict_choose("theirs") },
                    { "n", "cb", actions.conflict_choose("all") },
                },
                diff3 = {
                    { "n", "go", actions.diffget("ours") },
                    { "n", "gt", actions.diffget("theirs") },
                },
                file_panel = {
                    { "n", "j", actions.next_entry },
                    { "n", "k", actions.prev_entry },
                    { "n", "<cr>", actions.select_entry },
                    { "n", "zo", actions.open_fold },
                    { "n", "zc", actions.close_fold },
                    { "n", "<c-b>", actions.scroll_view(-0.25) },
                    { "n", "<c-f>", actions.scroll_view(0.25) },
                    { "n", "<tab>", actions.select_next_entry },
                    { "n", "<s-tab>", actions.select_prev_entry },
                    { "n", "gf", actions.goto_file_edit },
                },
                file_history_panel = {
                    { "n", "j", actions.next_entry },
                    { "n", "k", actions.prev_entry },
                    { "n", "<cr>", actions.select_entry },
                    { "n", "zo", actions.open_fold },
                    { "n", "zc", actions.close_fold },
                    { "n", "<c-b>", actions.scroll_view(-0.25) },
                    { "n", "<c-f>", actions.scroll_view(0.25) },
                    { "n", "<tab>", actions.select_next_entry },
                    { "n", "<s-tab>", actions.select_prev_entry },
                    { "n", "?", actions.open_commit_log },
                    { "n", "g!", actions.options },
                },
                option_panel = {
                    { "n", "<cr>", actions.select_entry },
                    { "n", "q", actions.close },
                    { "n", "<esc>", actions.close },
                },
            },
        })
    end,
}
