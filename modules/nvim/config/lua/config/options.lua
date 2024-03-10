-- Enables 24-bit RGB colors.
vim.opt.termguicolors = true

-- Default to 2 spaces for indentation.
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true -- replace tabs with spaces.

-- Disable soft wrap.
vim.opt.wrap = false

-- Mimic the style pattern of current file.
vim.opt.autoindent = true
vim.opt.smartindent = true

-- Disable backup file.
vim.opt.swapfile = false
vim.opt.backup = false

-- Enable file write on buffer switch.
vim.opt.autowriteall = true

vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("data") .. "/undo"

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.updatetime = 100

-- Sets terminal title to the current file name.
vim.opt.title = true

-- Show line numbers.
-- At current line number is absolute number,
-- surronding lines are relative numbers to current line.
vim.opt.number = true
vim.opt.relativenumber = true

-- Highlight cursor line.
vim.opt.cursorline = true

-- Higlight column.
vim.opt.signcolumn = "yes"

-- Case insientive search unless capital in search.
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Set vertical rulers.
vim.opt.colorcolumn = "80,120"

-- Set completeopt to have a better completion experience.
vim.opt.completeopt = { "menuone", "noselect" }

-- Pefer splitting to the bottom and to the right.
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Show indentation guides.
vim.opt.list = true
vim.opt.listchars:append("eol:¬")

-- Don't show startup screen
vim.opt.shortmess:append("c")
