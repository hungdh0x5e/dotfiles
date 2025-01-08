-- Enable mouse support
vim.opt.mouse = "a"

vim.opt.clipboard = "unnamedplus"

-- disable nvim intro
vim.opt.shortmess:append("sI")

-- Always display the status line
vim.opt.laststatus = 3
vim.opt.showmode = false
vim.opt.winbar = "%f %m"

-- Indenting
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2

-- Keep lines below cursor when scrolling
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 15

-- Automatically :write before running commands
vim.opt.autowrite = true

-- Reload files changed outside vim
vim.opt.autoread = true

vim.opt.textwidth = 120
vim.opt.list = true
vim.opt.listchars = { tab = "▸ ", trail = "·", nbsp = "␣" } -- eol = '↲' }

-- better search
vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- cursorline and number line
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number,line"

-- folding
vim.opt.foldenable = false
vim.opt.foldmethod = "indent"

-- interval for writing swap file to disk, also used by gitsigns
vim.opt.updatetime = 250
vim.opt.signcolumn = "yes"

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
vim.opt.whichwrap:append("<>[]hl")

-- When opening a window put it right or below the current one
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Persistent undo
-- Don't forget mkdir folder $HOME/.vim/undo
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.nvim/undo"
vim.opt.undolevels = 1000
vim.opt.undoreload = 10000

-- disable some default providers
vim.g["loaded_node_provider"] = 0
vim.g["loaded_python3_provider"] = 0
vim.g["loaded_perl_provider"] = 0
vim.g["loaded_ruby_provider"] = 0

-- Change diagnostic symbols in the sign column (gutter)
-- local signs = { ERROR = "", WARN = "", INFO = "", HINT = "" }
-- local signs = { ERROR = "󰅙", WARN = "", INFO = "󰋼", HINT = "" }
-- local diagnostic_signs = {}
-- for type, icon in pairs(signs) do
-- 	diagnostic_signs[vim.diagnostic.severity[type]] = icon
-- end
-- vim.diagnostic.config({ signs = { text = diagnostic_signs } })
