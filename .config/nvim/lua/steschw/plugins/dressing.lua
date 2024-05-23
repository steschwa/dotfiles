local win_utils = require("steschw.utils.window")

return {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    opts = {
        input = {
            enabled = true,
            default_prompt = "Input:",
            title_pos = "left",
            insert_only = false,
            start_in_insert = true,
            border = "rounded",
            relative = "cursor",
            mappings = {
                n = {
                    ["<esc>"] = "Close",
                    ["<cr>"] = "Confirm",
                },
                i = {
                    ["<c-q>"] = "Close",
                    ["<cr>"] = "Confirm",
                },
            },
        },
        select = {
            enabled = true,
            backend = { "builtin" },
            trim_prompt = true,
            builtin = {
                min_width = win_utils.calc_width({ percent = 0.4 }),
                max_width = win_utils.calc_width({ percent = 0.8 }),
            },
            mappings = {
                n = {
                    ["<esc>"] = "Close",
                    ["<cr>"] = "Confirm",
                },
                i = {
                    ["<c-q>"] = "Close",
                },
            },
        },
    },
}
