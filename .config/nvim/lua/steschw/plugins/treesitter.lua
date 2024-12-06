return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
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
                    -- disable highlighting if the file is larger than 100 KB
                    disable = function(_, buf)
                        local max_filesize = 100 * 1024 -- 100 KB
                        --- @diagnostic disable-next-line: undefined-field
                        local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(buf))
                        if not ok or not stats then
                            return false
                        end

                        return stats.size > max_filesize
                    end,
                    additional_vim_regex_highlighting = false,
                },
                indent = {
                    enable = true,
                    disable = { "yaml" },
                },
                textobjects = {
                    select = {
                        enable = true,
                        keymaps = {
                            ["af"] = "@function.outer",
                            ["if"] = "@function.inner",
                        },
                    },
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
            })
        end,
    },
}
