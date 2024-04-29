return {
    "folke/flash.nvim",
    version = "^1.0.0",
    keys = {
        {
            "ss",
            function()
                require("flash").jump()
            end,
            desc = "Flash",
        },
        {
            "S",
            function()
                require("flash").treesitter()
            end,
            desc = "Flash Treesitter",
        },
    },
    opts = {
        modes = {
            search = {
                enabled = false,
            },
        },
    },
}
