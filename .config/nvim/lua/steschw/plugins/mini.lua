return {
    {
        "echasnovski/mini.comment",
        version = "*",
        keys = {
            { "gc" },
            { "gcc" },
        },
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
        event = "InsertEnter",
        config = true,
    },
    {
        "echasnovski/mini.surround",
        version = "*",
        keys = {
            { "sa" },
            { "sd" },
            { "sr" },
        },
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
}
