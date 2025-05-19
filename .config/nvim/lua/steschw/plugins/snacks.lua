---@module "snacks"

return {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
        input = {
            enabled = true,
            icon = "",
        },
        picker = {
            enabled = true,
            prompt = " ",
            layouts = {
                select = {
                    hidden = { "preview" },
                    layout = {
                        box = "vertical",
                        backdrop = false,
                        width = 0.4,
                        min_width = 80,
                        border = "none",
                        title = "{title}",
                        title_pos = "center",
                        {
                            win = "input",
                            height = 1,
                            border = { " ", " ", " ", " ", "▁", "▁", "▁", " " },
                        },
                        {
                            win = "list",
                            border = "solid",
                        },
                    },
                },
            },
        },

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
