local filetypes = {
    "css",
    "scss",
    "dump",
}

return {
    "catgoose/nvim-colorizer.lua",
    event = { "BufReadPre", "BufNewFile" },
    filetypes = filetypes,
    config = function()
        require("colorizer").setup({
            lazy_load = true,
            filetypes = filetypes,
            user_default_options = {
                mode = "virtualtext",
                virtualtext = " ",
                css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
            },
        })
    end,
}
