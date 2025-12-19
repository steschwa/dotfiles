return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        build = ":TSUpdate",
    },
    {
        "ravsii/tree-sitter-d2",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        version = "*",
        build = "make nvim-install",
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        branch = "main",
        keys = {
            -- selection
            {
                "af",
                function()
                    require("nvim-treesitter-textobjects.select").select_textobject(
                        "@function.outer",
                        "textobjects"
                    )
                end,
                mode = { "x", "o" },
            },
            {
                "if",
                function()
                    require("nvim-treesitter-textobjects.select").select_textobject(
                        "@function.inner",
                        "textobjects"
                    )
                end,
                mode = { "x", "o" },
            },

            -- swapping
            {
                "sl",
                function()
                    require("nvim-treesitter-textobjects.swap").swap_next("@parameter.inner")
                end,
            },
            {
                "sh",
                function()
                    require("nvim-treesitter-textobjects.swap").swap_previous("@parameter.inner")
                end,
            },

            -- jumps
            {
                "]f",
                function()
                    require("nvim-treesitter-textobjects.move").goto_next_start(
                        "@function.outer",
                        "textobjects"
                    )
                end,
            },
            {
                "[f",
                function()
                    require("nvim-treesitter-textobjects.move").goto_previous_start(
                        "@function.outer",
                        "textobjects"
                    )
                end,
            },
        },
    },
    {
        "windwp/nvim-ts-autotag",
        opts = {},
    },
}
