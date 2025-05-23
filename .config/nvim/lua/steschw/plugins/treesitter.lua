return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = "VeryLazy",
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
            "windwp/nvim-ts-autotag",
            "JoosepAlviste/nvim-ts-context-commentstring",
        },
        config = function()
            local configs = require("nvim-treesitter.configs")

            --- @diagnostic disable-next-line: missing-fields
            configs.setup({
                sync_install = false,
                highlight = {
                    enable = true,
                    -- disable highlighting if the file is larger than 500 KB
                    disable = function(_, buf)
                        local max_filesize = 500 * 1024
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
                            ["]f"] = "@function.outer",
                        },
                        goto_previous_start = {
                            ["[f"] = "@function.outer",
                        },
                    },
                },
            })
        end,
    },
    {
        "windwp/nvim-ts-autotag",
        lazy = true,
        config = true,
    },
    {
        "JoosepAlviste/nvim-ts-context-commentstring",
        lazy = true,
        opts = {
            -- https://github.com/JoosepAlviste/nvim-ts-context-commentstring/wiki/Integrations#minicomment
            enable_autocmd = false,
            languages = {
                nu = "# %s",
            },
        },
    },
}
