-- hello

return {
    "zbirenbaum/copilot.lua",
    lazy = true,
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
        copilot_node_command = "/opt/homebrew/bin/node",
        suggestion = {
            auto_trigger = true,
            keymap = {
                accept = "<C-y>",
                dismiss = "<C-e>",
                toggle_auto_trigger = "<C-Tab>",
            },
        },
    },
}
