local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    { import = "steschw.plugins" },
    { import = "steschw.plugins.colorschemes" },
}, {
    defaults = {
        lazy = false,
        version = false,
    },
    ui = {
        border = "single",
        backdrop = 100,
    },
    checker = {
        enabled = true,
        notify = false,
    },
    change_detection = {
        enabled = false,
        notify = false,
    },
})
