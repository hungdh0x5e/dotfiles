vim.g.mapleader = " "
vim.opt.termguicolors = true
vim.g.have_nerd_font = true

require("options")

vim.schedule(function()
	require("keymap")
	require("autocmd")
end)

vim.g.base46_cache = vim.fn.stdpath("data") .. "/base46_cache/"

require("lazy-bootstrap")
require("lazy-plugins")

dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")
dofile(vim.g.base46_cache .. "lsp")
dofile(vim.g.base46_cache .. "syntax")
dofile(vim.g.base46_cache .. "whichkey")
dofile(vim.g.base46_cache .. "treesitter")
