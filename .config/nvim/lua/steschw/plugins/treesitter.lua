return {
    {
        "nvim-treesitter/nvim-treesitter",
        version = false,
        build = ":TSUpdate",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
            {
                "nushell/tree-sitter-nu",
                ft = { "nu" },
            },
            {
                "windwp/nvim-ts-autotag",
                config = true,
            },
            {
                "JoosepAlviste/nvim-ts-context-commentstring",
            },
        },
        config = function()
            local configs = require("nvim-treesitter.configs")

            --- @diagnostic disable-next-line: missing-fields
            configs.setup({
                sync_install = false,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
                indent = {
                    enable = true,
                    disable = { "yaml" },
                },
                textobjects = {
                    swap = {
                        enable = true,
                        swap_next = {
                            ["sl"] = "@parameter.inner",
                        },
                        swap_previous = {
                            ["sh"] = "@parameter.inner",
                        },
                    },
                    move = {
                        enable = true,
                        set_jumps = true,
                        goto_next_start = {
                            ["[f"] = "@function.outer",
                        },
                        goto_previous_start = {
                            ["]f"] = "@function.outer",
                        },
                    },
                },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "vv",
                        node_incremental = "[v",
                        node_decremental = "]v",
                    },
                },
            })
        end,
    },
}
