-- Theme

vim.cmd.colorscheme("lunaperche")

-- Basic

vim.wo.number = true
vim.o.relativenumber = true
vim.o.cursorline = true
vim.o.wrap = false
vim.o.scrolloff = 10
vim.o.sidescrolloff = 8

-- Indentation

vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.autoindent = true

-- Search

vim.o.ignorecase = true
vim.o.smartcase = true

-- Visual

vim.o.winborder = "single"
vim.o.showmode = false
vim.o.termguicolors = true
vim.o.signcolumn = "yes"
vim.o.showmatch = true
vim.o.matchtime = 2
vim.o.cmdheight = 1
vim.o.completeopt = "menuone,noinsert,noselect"
vim.o.pumheight = 10
vim.opt.concealcursor = ""
vim.o.lazyredraw = true
vim.o.synmaxcol = 300

-- File

vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false
vim.o.undofile = true
vim.o.undodir = vim.fn.expand("~/.vim/undofir")
vim.o.updatetime = 300
vim.o.timeoutlen = 500
vim.o.ttimeoutlen = 0
vim.o.autoread = true

-- Behavior

vim.o.hidden = true
vim.o.errorbells = true
vim.o.backspace = "indent,eol,start"
vim.o.autochdir = false
vim.o.mouse = "a"
vim.o.modifiable = true
vim.o.encoding = "UTF-8"
vim.opt.clipboard:append 'unnamedplus'
vim.opt.iskeyword:append '-'
vim.opt.path:append '**'

-- Folding

vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldlevel = 99

-- Split Behavior

vim.o.splitbelow = true
vim.o.splitright = true

-- Command Line Completion

vim.o.wildmenu = true
vim.o.wildmode = "longest:full,full"

-- Performance

vim.o.redrawtime = 10000
vim.o.maxmempattern = 20000

-- Undo Directory

local undodir = vim.fn.expand("~/.vim/undodir")
if vim.fn.isdirectory(undodir) == 0 then
  vim.fn.mkdir(undodir, "p")
end
