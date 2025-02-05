local Path = require("steschw.utils.path")

-- see :h telescope.defaults.vimgrep_arguments
local rg_cmd = {
    "rg",
    "--color=never",
    "--no-heading",
    "--with-filename",
    "--line-number",
    "--column",
    "--smart-case",
    "--trim",
}

local fd_cmd = {
    "fd",
    "--color",
    "never",
    "--hidden",
    "--type",
    "f",
    "--strip-cwd-prefix",
}

local border_bottom = { " ", " ", "▁", " ", " ", " ", "▁", "▁" }
local border_none = { " ", " ", " ", " ", " ", " ", " ", " " }

return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-telescope/telescope-fzf-native.nvim",
            "fixme.nvim",
        },
        cmd = "Telescope",
        keys = {
            { "<leader>p", "<cmd>Telescope find_files<cr>" },
            { "<leader>f", "<cmd>Telescope live_grep<cr>" },
            { "<leader>h", "<cmd>Telescope help_tags<cr>" },
            {
                "<leader>b",
                function()
                    require("telescope.builtin").buffers({
                        preview = false,
                        ignore_current_buffer = true,
                        sort_mru = true,
                    })
                end,
            },
            { "<leader>s", "<cmd>Telescope lsp_document_symbols<cr>" },
            {
                "<leader>c",
                function()
                    require("telescope.builtin").find_files({
                        cwd = vim.fn.stdpath("config"),
                    })
                end,
            },
            { "<leader>w", "<cmd>Telescope quickfixhistory<cr>" },
            { "<leader><leader>", "<cmd>Telescope pickers<cr>" },
        },
        config = function()
            local telescope = require("telescope")
            local actions = require("telescope.actions")
            local action_state = require("telescope.actions.state")

            local action_qflist = actions.smart_send_to_qflist + actions.open_qflist

            telescope.setup({
                defaults = {
                    prompt_prefix = "  ",
                    selection_caret = "  ",
                    multi_icon = " ",
                    borderchars = {
                        preview = border_bottom,
                        results = border_bottom,
                        prompt = border_none,
                    },
                    vimgrep_arguments = rg_cmd,
                    path_display = function(_, path)
                        return Path.format_path_peak(path)
                    end,
                    dynamic_preview_title = true,
                    results_title = false,
                    cache_picker = {
                        num_pickers = 5,
                        limit_entries = 100,
                        ignore_empty_prompt = true,
                    },
                    layout_strategy = "vertical",
                    layout_config = {
                        vertical = {
                            width = 0.5,
                        },
                    },
                    mappings = {
                        n = {
                            ["q"] = actions.close,
                            ["<C-q>"] = action_qflist,
                        },
                        i = {
                            ["<C-j>"] = actions.move_selection_next,
                            ["<C-k>"] = actions.move_selection_previous,
                            ["<C-q>"] = action_qflist,
                        },
                    },
                },
                pickers = {
                    find_files = {
                        find_command = fd_cmd,
                    },
                    live_grep = {
                        max_results = 20,
                        disable_coordinates = true,
                    },
                    lsp_document_symbols = {
                        symbol_width = 0.5,
                    },
                    buffers = {
                        previewer = false,
                        layout_config = {
                            height = 20,
                        },
                    },
                    quickfixhistory = {
                        previewer = false,
                        layout_config = {
                            height = 15,
                            width = 0.3,
                        },
                        mappings = {
                            n = {
                                ["<cr>"] = function(prompt_bufnr)
                                    local qf_nr = action_state.get_selected_entry().nr
                                    actions.close(prompt_bufnr)
                                    vim.cmd(qf_nr .. "chi")
                                    actions.open_qflist(prompt_bufnr)
                                end,
                            },
                        },
                    },
                },
                extensions = {
                    fzf = {},
                },
            })

            telescope.load_extension("fzf")
        end,
    },
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        lazy = true,
    },
}
