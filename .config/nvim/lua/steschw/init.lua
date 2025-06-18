vim.api.nvim_create_autocmd("User", {
    pattern = "VeryLazy",
    callback = function()
        require("steschw.config.keymaps")
        require("steschw.config.commands")
    end,
})

require("steschw.config.autocmds")
