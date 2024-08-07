return {
    "NvChad/nvim-colorizer.lua",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        require("colorizer").setup({
            filetypes = {
                "css",
                "scss",
                "dump",
                "go",
            },
            user_default_options = {
                mode = "virtualtext",
                virtualtext = "■■",
                RGB = true, -- #RGB hex codes
                RRGGBB = true, -- #RRGGBB hex codes
                names = true, -- "Name" codes like Blue or blue
                css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
            },
        })
    end,
}
