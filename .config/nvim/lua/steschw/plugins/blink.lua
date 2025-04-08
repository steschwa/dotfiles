---@module "blink.cmp"

return {
    {
        "saghen/blink.cmp",
        version = "*",
        event = "CmdlineEnter",
        dependencies = {
            "steschwa/snipman.nvim",
        },
        ---@type blink.cmp.Config
        opts = {
            enabled = function()
                local disabled_filetypes = {
                    "DressingInput",
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
                ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
                ["<esc>"] = { "hide", "fallback" },
                ["<C-y>"] = { "select_and_accept" },

                ["<C-p>"] = { "select_prev", "fallback_to_mappings" },
                ["<C-n>"] = { "select_next", "fallback_to_mappings" },

                ["<C-b>"] = { "scroll_documentation_up", "fallback" },
                ["<C-f>"] = { "scroll_documentation_down", "fallback" },
            },
        },
    },
    {
        "steschwa/snipman.nvim",
        version = "*",
        opts = {
            snippets_by_ft = {
                go = {
                    { "main", require("steschw.snippets.go.main") },
                },
                html = {
                    { "doc", require("steschw.snippets.html.document") },
                },
                scss = {
                    { "sclass", require("steschw.snippets.css.class-from-filename") },
                },
                typescript = {
                    { "log", require("steschw.snippets.typescript.console-log") },
                    { "imp", require("steschw.snippets.typescript.import-statement") },
                    { "hook", require("steschw.snippets.typescript.react-hook") },
                },
                typescriptreact = {
                    { "imp", require("steschw.snippets.typescript.import-statement") },
                    { "log", require("steschw.snippets.typescript.console-log") },
                    { "hook", require("steschw.snippets.typescript.react-hook") },

                    { "scomp", require("steschw.snippets.react.component") },
                    { "sclass", require("steschw.snippets.react.component-classname") },
                    { "scss", require("steschw.snippets.react.component-scss") },
                    { "sprops", require("steschw.snippets.react.component-props") },
                },
                tex = {
                    { "info", require("steschw.snippets.latex.info") },
                },
            },
        },
    },
}
