---@module "blink.cmp"

return {
    "saghen/blink.cmp",
    version = "*",
    event = { "CmdlineEnter", "InsertEnter" },
    dependencies = {
        "steschwa/snipman.nvim",
    },
    ---@type blink.cmp.Config
    opts = {
        enabled = function()
            local disabled_filetypes = {
                "grapple",
                "TelescopePrompt",
            }

            return not vim.tbl_contains(disabled_filetypes, vim.bo.filetype)
        end,
        completion = {
            accept = {
                auto_brackets = {
                    enabled = false,
                },
            },
            list = {
                max_items = 50,
            },
            menu = {
                draw = {
                    columns = {
                        { "label", "label_description", gap = 1 },
                        { "kind_icon", "kind", gap = 1 },
                    },
                },
            },
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 250,
                window = {
                    max_width = vim.o.columns,
                },
            },
        },
        fuzzy = {
            sorts = { "exact", "score", "sort_text" },
        },
        sources = {
            default = { "lazydev", "lsp", "snippets", "snipman", "path" },
            providers = {
                lazydev = {
                    name = "LazyDev",
                    module = "lazydev.integrations.blink",
                    score_offset = 100,
                },
                snipman = {
                    name = "Snipman",
                    module = "snipman.blink",
                },
            },
        },
        keymap = {
            preset = "none",
            ["<C-space>"] = { "show", "hide" },
            ["<esc>"] = { "hide", "fallback" },
            ["<C-y>"] = { "select_and_accept" },
            ["<C-p>"] = { "select_prev", "fallback_to_mappings" },
            ["<C-n>"] = { "select_next", "fallback_to_mappings" },

            ["<C-u>"] = {
                function(cmp)
                    return cmp.scroll_documentation_up(2)
                end,
                "fallback",
            },
            ["<C-d>"] = {
                function(cmp)
                    return cmp.scroll_documentation_down(2)
                end,
                "fallback",
            },
        },
    },
}
