---@module "snacks"

return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        input = {
            enabled = true,
            icon = "",
        },
        -- picker = { enabled = true },
        -- notifier = { enabled = true },
        -- quickfile = { enabled = true },
        -- scope = { enabled = true },
        -- scroll = { enabled = true },
        -- statuscolumn = { enabled = true },
        -- words = { enabled = true },
        styles = {
            input = {
                relative = "cursor",
                row = -3,
                col = 0,
                border = "single",
                title_pos = "left",
                width = 50,
                bo = {
                    buftype = "nofile",
                },
            },
        },
    },
}
