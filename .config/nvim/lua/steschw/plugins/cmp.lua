local keymap = require("steschw.utils.keys").keymap

local CMP_BORDER = { "🭽", "▔", "🭾", "▕", "🭿", "▁", "🭼", "▏" }

return {
    {
        "hrsh7th/nvim-cmp",
        version = false,
        event = {
            "InsertEnter",
        },
        dependencies = {
            "L3MON4D3/LuaSnip",
            "onsails/lspkind.nvim",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-nvim-lsp",
            "saadparwaiz1/cmp_luasnip",
        },
        config = function()
            local cmp = require("cmp")
            local ls = require("luasnip")
            local lspkind = require("lspkind")

            cmp.setup({
                snippet = {
                    expand = function(args)
                        ls.lsp_expand(args.body)
                    end,
                },
                mapping = {
                    ["<c-k>"] = cmp.mapping.select_prev_item(),
                    ["<c-j>"] = cmp.mapping.select_next_item(),
                    ["<tab>"] = cmp.mapping.select_next_item(),
                    ["<s-tab>"] = cmp.mapping.select_prev_item(),

                    ["<c-u>"] = cmp.mapping.scroll_docs(-5),
                    ["<c-d>"] = cmp.mapping.scroll_docs(5),

                    ["<c-space>"] = cmp.mapping.complete(),
                    ["<esc>"] = cmp.mapping.abort(),
                    ["<cr>"] = cmp.mapping.confirm({ select = false }),
                },
                formatting = {
                    fields = { "abbr", "menu", "kind" },
                    expandable_indicator = false,
                    format = lspkind.cmp_format({
                        mode = "symbol_text",
                        preset = "codicons",
                    }),
                },
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                    { name = "path" },
                }),
                window = {
                    completion = cmp.config.window.bordered({
                        winhighlight = "Normal:CmpNormal,CursorLine:CmpCursorLine,Search:None,FloatBorder:CmpBorder",
                        border = CMP_BORDER,
                    }),
                    documentation = cmp.config.window.bordered({
                        winhighlight = "Normal:CmpDocsNormal,FloatBorder:CmpDocsBorder",
                        border = CMP_BORDER,
                    }),
                },
            })
        end,
    },
    {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        config = function()
            local ls = require("luasnip")
            ls.setup()

            ls.add_snippets("typescriptreact", require("steschw.plugins.snippets.typescriptreact"))
            ls.add_snippets("typescript", require("steschw.plugins.snippets.typescript"))
            ls.add_snippets("scss", require("steschw.plugins.snippets.scss"))
            ls.add_snippets("html", require("steschw.plugins.snippets.html"))

            --- @param dir 1 | -1
            local function jump(dir)
                return function()
                    if ls.locally_jumpable(dir) then
                        ls.jump(dir)
                    end
                end
            end

            keymap("i", "<c-n>", jump(1))
            keymap("i", "<c-p>", jump(-1))
        end,
    },
}
