require "nvchad.options"

-- add yours here!

vim.opt.textwidth = 120
vim.opt.list = true
vim.opt.listchars = { tab = "▸ ", trail = "·", nbsp = "␣" } -- eol = '↲' }
vim.opt.relativenumber = true

-- Keep lines below cursor when scrolling
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 15

vim.opt.hlsearch = false
vim.opt.cursorlineopt = "number,line"

vim.opt.foldenable = false
vim.opt.foldmethod = "indent"

-- Don't show the dumb matching stuff.
-- vim.opt.shortmess:append "o"

-- Don't do comment stuffs when I use o/O
vim.opt_local.formatoptions:remove "o"

-- seperate clipboard between neovim vs system clipboard
-- set to unnameplus to sync to system clipboard
vim.opt.clipboard = ""
