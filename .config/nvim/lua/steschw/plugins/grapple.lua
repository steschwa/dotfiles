--- @param index number
local function select(index)
    return {
        string.format("<leader>%d", index),
        string.format("<cmd>Grapple select index=%d<cr>", index),
    }
end

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
            "<cmd>Grapple toggle_tags<cr>",
        },
        select(1),
        select(2),
        select(3),
        select(4),
        select(5),
        select(6),
        select(7),
        select(8),
        select(9),
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
