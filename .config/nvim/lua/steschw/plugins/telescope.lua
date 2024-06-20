local utils_path = require("steschw.utils.path")

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
    "--color=never",
    "--hidden",
    "--exclude",
    "node_modules",
    "--exclude",
    ".git",
    "--type",
    "f",
    "--strip-cwd-prefix",
}

return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
            },
        },
        keys = {
            { "<leader>p", "<cmd>Telescope find_files<cr>" },
            { "<leader>f", "<cmd>Telescope live_grep<cr>" },
            { "<leader>h", "<cmd>Telescope help_tags<cr>" },
            { "<leader>b", "<cmd>Telescope buffers<cr>" },
            { "<leader>s", "<cmd>Telescope lsp_document_symbols<cr>" },
            { "<leader><leader>", "<cmd>Telescope pickers<cr>" },
        },
        config = function()
            local telescope = require("telescope")
            local actions = require("telescope.actions")

            local action_qflist = actions.smart_send_to_qflist + actions.open_qflist

            telescope.setup({
                defaults = {
                    prompt_prefix = " ",
                    selection_caret = " ",
                    multi_icon = " ",
                    borderchars = {
                        preview = { " ", " ", "▁", " ", " ", " ", "▁", "▁" },
                        results = { " ", " ", "▁", " ", " ", " ", "▁", "▁" },
                        prompt = { " ", " ", " ", " ", " ", " ", " ", " " },
                    },
                    vimgrep_arguments = rg_cmd,
                    path_display = function(_, path)
                        return utils_path.format_path_peak(path)
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
                },
                extensions = {
                    fzf = {
                        fuzzy = true,
                        override_generic_sorter = true,
                        override_file_sorter = true,
                        case_mode = "ignore_case",
                    },
                },
            })
        end,
    },
}
