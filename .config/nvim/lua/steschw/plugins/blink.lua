---@module "blink.cmp"

return {
    "saghen/blink.cmp",
    version = "*",
    event = "CmdlineEnter",
    dependencies = { "L3MON4D3/LuaSnip" },
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
        snippets = { preset = "luasnip" },
        sources = {
            default = { "lazydev", "lsp", "snippets", "path" },
            providers = {
                lazydev = {
                    name = "LazyDev",
                    module = "lazydev.integrations.blink",
                    score_offset = 100,
                },
            },
        },
    },
}
