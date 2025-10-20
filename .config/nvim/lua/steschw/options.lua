vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- indenting
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.tabstop = 4

-- disable default styles for some filetypes
vim.g.yaml_recommended_style = false -- see $VIMRUNTIME/ftplugin/yaml.vim

vim.opt.backup = false
vim.opt.clipboard = ""
vim.opt.cmdheight = 1
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.conceallevel = 0
vim.opt.cursorline = true
vim.opt.diffopt:remove("linematch:40")
vim.opt.errorformat = { "%f:%l:%m", "%f:%l", "%f" }
vim.opt.exrc = true
vim.opt.fileencoding = "utf-8"
vim.opt.grepformat = "%f:%l:%c:%m"
vim.opt.grepprg = "rg --vimgrep --no-heading --smart-case --no-ignore"
vim.opt.history = 100
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.iskeyword:append({ "-", "_" })
vim.opt.jumpoptions = "stack"
vim.opt.number = true
vim.opt.numberwidth = 4
vim.opt.pumheight = 10
vim.opt.relativenumber = true
vim.opt.scrolloff = 1
vim.opt.shiftround = true
vim.opt.shortmess:append({ a = true, W = true, s = true, S = true })
vim.opt.showmode = false
vim.opt.showtabline = 1
vim.opt.sidescrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.smartcase = true
vim.opt.splitbelow = true
vim.opt.splitkeep = "cursor"
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.termguicolors = true
vim.opt.timeoutlen = 500
vim.opt.undofile = true
vim.opt.updatetime = 1000
vim.opt.whichwrap:append("<,>,[,],h,l")
vim.opt.wrap = false
vim.opt.writebackup = false
-- vim.opt.winborder = "single"
vim.opt.fillchars:append({
    diff = " ",
    fold = " ",
})
vim.opt.statusline = "%{%v:lua.require'steschw.statusline'.create()%}"

vim.g.qf_disable_statusline = true

vim.filetype.add({
    filename = {
        [".ignore"] = "sh.ignore",
        [".fdignore"] = "sh.ignore",
        [".rgignore"] = "sh.ignore",
        [".nvimignore"] = "sh.ignore",
        ["Brewfile"] = "ruby.Brewfile",
        ["docker-compose.yml"] = "yaml.docker-compose",
        ["docker-compose.yaml"] = "yaml.docker-compose",
    },
    extension = {
        env = "sh.env",
        hurl = "hurl",
        d2 = "d2",
    },
    pattern = {
        [".*/.github/workflows/.*%.yml"] = "yaml.github-action",
        [".*/.github/workflows/.*%.yaml"] = "yaml.github-action",
        ["compose%.yaml"] = "yaml.docker-compose",
        [".*%.compose%.yaml"] = "yaml.docker-compose",
        [".*/kitty/.*%.conf"] = "kitty",
    },
})

vim.diagnostic.config({
    virtual_text = {
        source = "if_many",
        prefix = "",
    },
    update_in_insert = false,
    severity_sort = true,
    float = {
        focusable = true,
        style = "minimal",
        border = "single",
        source = true,
        header = "",
    },
    signs = {
        text = require("steschw.utils.diagnostics").get_signs(),
    },
})
