return {
    "cbochs/grapple.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    keys = {
        {
            "mm",
            function()
                require("grapple").toggle()
                vim.cmd("redrawstatus!")
            end,
        },
        {
            "<leader>m",
            function()
                require("grapple").toggle_tags()
            end,
        },
    },
    opts = {
        icons = true,
        scope = "git_branch",
        style = "basename",
        tag_title = function()
            return "Grapple Tags"
        end,
        win_opts = {
            width = 80,
        },
    },
}
