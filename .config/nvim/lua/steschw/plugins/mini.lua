return {
    {
        "echasnovski/mini.comment",
        version = "*",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "JoosepAlviste/nvim-ts-context-commentstring",
        },
        opts = {
            options = {
                ignore_blank_line = true,
                start_of_line = false,
                pad_comment_parts = true,
                custom_commentstring = function()
                    return require("ts_context_commentstring").calculate_commentstring()
                end,
            },
            mappings = {
                comment = "gc",
                comment_line = "gcc",
                textobject = "gc",
            },
        },
    },
    {
        "echasnovski/mini.pairs",
        version = "*",
        event = { "BufReadPre", "BufNewFile" },
        opts = {
            modes = {
                insert = true,
                command = false,
                terminal = false,
            },
        },
    },
    {
        "echasnovski/mini.surround",
        version = "*",
        event = { "BufReadPre", "BufNewFile" },
        opts = {
            mappings = {
                add = "sa",
                delete = "sd",
                replace = "sr",
                update_n_lines = "",
                find = "",
                find_left = "",
                highlight = "",
                suffix_last = "",
                suffix_next = "",
            },
        },
    },
    {
        "echasnovski/mini.move",
        version = "*",
        event = { "BufReadPre", "BufNewFile" },
        opts = {
            options = {
                reindent_linewise = false,
            },
            mappings = {
                -- visual mode
                left = "<S-h>",
                right = "<S-l>",
                down = "<S-j>",
                up = "<S-k>",

                -- normal mode
                line_left = "",
                line_right = "",
                line_down = "",
                line_up = "",
            },
        },
    },
}
