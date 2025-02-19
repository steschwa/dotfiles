vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local opt = vim.opt

opt.backup = false
opt.clipboard = ""
opt.cmdheight = 1
opt.completeopt = "menu,menuone,noselect"
opt.conceallevel = 0
opt.cursorline = true
opt.expandtab = true
opt.exrc = true
opt.fileencoding = "utf-8"
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep --no-heading --smart-case --no-ignore"
opt.history = 100
opt.hlsearch = true
opt.ignorecase = true
opt.iskeyword:append({ "-", "_" })
opt.jumpoptions = "stack"
opt.number = true
opt.numberwidth = 4
opt.pumheight = 10
opt.relativenumber = true
opt.scrolloff = 1
opt.shiftround = true
opt.shiftwidth = 4
opt.shortmess:append({ a = true, W = true, s = true, S = true })
opt.showmode = false
opt.showtabline = 1
opt.sidescrolloff = 8
opt.signcolumn = "yes"
opt.smartcase = true
opt.smartindent = true
opt.splitbelow = true
opt.splitkeep = "cursor"
opt.splitright = true
opt.swapfile = false
opt.tabstop = 4
opt.termguicolors = true
opt.timeoutlen = 500
opt.undofile = true
opt.updatetime = 1000
opt.whichwrap:append("<,>,[,],h,l")
opt.wrap = false
opt.writebackup = false
opt.fillchars:append({
    diff = " ",
    fold = " ",
})

vim.g.qf_disable_statusline = true
opt.statusline = "%{%v:lua.require'steschw.statusline'.create()%}"

vim.filetype.add({
    filename = {
        [".ignore"] = "sh",
        [".fdignore"] = "sh",
        [".rgignore"] = "sh",
        [".nvimignore"] = "sh",
        ["Brewfile"] = "ruby",
        ["docker-compose.yml"] = "yaml.docker-compose",
    },
    extension = {
        env = "sh",
        hurl = "hurl",
        tex = "tex",
        d2 = "d2",
    },
    pattern = {
        [".*/.github/workflows/.*%.yml"] = "yaml.github-action",
        [".*/.github/workflows/.*%.yaml"] = "yaml.github-action",
    },
})
