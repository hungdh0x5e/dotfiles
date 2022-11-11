local func = require('user.functions')

local augroup = vim.api.nvim_create_augroup('keymap_cmds', {clear = true})
local autocmd = vim.api.nvim_create_autocmd

-- Bind options
local bind = vim.keymap.set
local remap = {remap = true}
local silent = {silent=true}

-- Leader - (Spacebar)
vim.g.mapleader = ' '

-- ========================================================================== --
-- ==                             KEY MAPPINGS                             == --
-- ========================================================================== --

bind('n', '<Leader><Leader>r', ':so ~/dotfiles/nvim-lua/init.lua<CR>')

-- Switch between the last two files
bind('n', 'leader><leader>', '<c-^>')

bind('n', '<leader>,', ':noh<cr>', {silent=true, desc='Stop highlight after searching'})

-- Run the q macro
bind('n', '<leader>q', '@q')

-- Quickly close windows
bind('n', '<leader>x', ':x<CR>')
bind('n', '<leader>X', ':q!<CR>')

-- Write file
bind('n', '<Leader>w', ':write<CR>')

-- Safe quit
bind('n', '<Leader>qq', ':quitall<CR>')

-- Force quit
bind('n', '<Leader>Q', ':quitall!<CR>')

-- Close buffer
bind('n', '<Leader>bq', ':bdelete<CR>')

-- Move to last active buffer
bind('n', '<Leader>bl', ':buffer #<CR>')

-- Navigate between buffers
bind('n', '[b', ':bprevious<CR>')
bind('n', ']b', ':bnext<CR>')

-- Open new tabpage
bind('n', '<Leader>tn', ':tabnew<CR>')

-- Navigate between tabpages
bind('n', '[t', ':tabprevious<CR>')
bind('n', ']t', ':tabnext<CR>')

-- Quicker window movement
bind('n', '<C-j>', '<C-w>j')
bind('n', '<C-k>', '<C-w>k')
bind('n', '<C-h>', '<C-w>h')
bind('n', '<C-l>', '<C-w>l')
bind('n', '<bs>', ':TmuxNavigateLeft<cr>', {silent=true})

-- Search will center on the line it's found in
bind('n', 'n', 'nzzzv')
bind('n', 'N', 'Nzzzv')
bind('n', '#', '#zz')
bind('n', '*', '*zz')
bind('n', 'g;', 'g;zz')

bind('i', 'jk', '<ESC>', {desc='quick escape in INSERT mode'})

-- Delete in select mode
bind('s', '<BS>', '<C-g>"_c')
bind('s', '<M-h>', '<BS>', remap)

-- Because of reasons
bind('i', '<M-h>', '<BS>', remap)
bind('s', '<Space>', '<BS>', {remap = true, nowait = true})

bind({'i', 'c'}, '<M-a>', '<Left>')
bind({'i', 'c'}, '<M-d>', '<Right>')
bind({'i', 'c'}, '<M-1>', '<')
bind({'i', 'c'}, '<M-2>', '>', remap)
bind('i', '<M-Space>', '<Enter><Up><Esc>o')

-- Whatever you delete, make it go away
bind({'n', 'x'}, 'c', '"_c')
bind({'n', 'x'}, 'C', '"_C')
bind({'n', 'x'}, 'x', '"_x')
bind({'n', 'x'}, 'X', '"_c')

-- Open a Quickfix window for the last search.
-- nmap("<leader>?", ":execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>")

-- Reselect visual block after indent/outdent
bind('v', '<', '<gv')
bind('v', '>', '>gv')

-- Use tab to jump between blocks, because it's easier
bind('n', '<tab>', '%')
bind('v', '<tab>', '%')

-- zoom a vim pane, <C-w>= to re-balance
-- bind('n', '<leader>-', ':wincmd _<cr>:wincmd \|<cr>')
bind('n', '<leader>=', ':wincmd =<cr>')

-- resize panes
bind('n', '<Right>', ':vertical resize +5<cr>', silent)
bind('n', '<Left>', ':vertical resize -5<cr>', silent)
bind('n', '<Up>', ':resize +5<cr>', silent)
bind('n', '<Down>', ':resize -5<cr>', silent)

