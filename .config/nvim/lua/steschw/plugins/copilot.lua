-- hello

return {
    "zbirenbaum/copilot.lua",
    lazy = true,
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
        copilot_node_command = "/opt/homebrew/opt/node@24/bin/node",
        panel = {
            enabled = true,
        },
        suggestion = {
            auto_trigger = true,
            keymap = {
                accept = "<C-y>",
                dismiss = "<C-e>",
            },
        },
    },
}
