return {
    {
        "nvim-treesitter/nvim-treesitter",
        version = false,
        build = ":TSUpdate",
        cmd = { "TSUpdateSync" },
        event = { "BufReadPost", "BufNewFile" },
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
            "nushell/tree-sitter-nu",
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
    {
        "JoosepAlviste/nvim-ts-context-commentstring",
        config = function()
            vim.g.skip_ts_context_commentstring_module = true

            --- @diagnostic disable-next-line: missing-parameter
            require("ts_context_commentstring").setup()
        end,
    },
    {
        "windwp/nvim-ts-autotag",
        config = true,
    },
}
