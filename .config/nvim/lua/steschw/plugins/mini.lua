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
        config = true,
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
        "echasnovski/mini.diff",
        version = "*",
        event = { "BufReadPre", "BufNewFile" },
        keys = {
            {
                "gp",
                function()
                    require("mini.diff").toggle_overlay(0)
                end,
            },
        },
        opts = {
            view = {
                style = "sign",
            },
            mappings = {
                apply = "",
                reset = "",
                textobject = "",
                goto_first = "",
                goto_prev = "[h",
                goto_next = "]h",
                goto_last = "",
            },
        },
    },
}
