local fns = require('user.functions')

local command = vim.api.nvim_create_user_command
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup('user_cmds', {clear = true})

-- Trigger `autoread` when files changes on disk
-- https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
-- https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
vim.cmd("autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif")
-- Notification after file change
vim.cmd('autocmd FileChangedShellPost * echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None')
-- Trigger autoread when changing buffers or coming back to vim in terminal.
vim.cmd('au FocusGained,BufEnter * :silent! !')

-- highlight the number current line
vim.cmd([[
  hi CursorLineNR cterm=bold ctermbg=NONE ctermfg=red
  augroup CLNRSet
    autocmd! ColorScheme * hi CursorLineNR cterm=bold ctermbg=NONE ctermfg=red
  augroup END
]])

-- Toggle relative numbering, and set to absolute on loss of focus or insert mode
autocmd({'BufEnter', 'FocusLost', 'InsertLeave', 'WinLeave'}, {
  pattern = {'*'},
  group = augroup,
  callback = fns.toggle_relative_on
})
autocmd({'BufLeave', 'FocusGained', 'InsertEnter'}, {
  pattern = {'*'},
  group = augroup,
  callback = fns.toggle_number_on
})

-- update dir to current file
autocmd('BufEnter', {
  pattern = {'*'},
  group = augroup,
  desc = 'update dir to current file',
  command = 'silent! cd %:p:h'
})

-- auto-save when switching window or leaving vim
autocmd({'FocusLost', 'WinLeave'}, {
  pattern = {'*'},
  group = augroup,
  desc = 'auto-save when switching window or leaving vim',
  command = ':silent! wa'
})

autocmd('TextYankPost', {
  desc = 'highlight text after is copied',
  group = augroup,
  callback = function()
    vim.highlight.on_yank({higroup = 'Visual', timeout = 80})
  end
})

autocmd('CmdWinEnter', {group = augroup, command = 'quit'})

autocmd('FileType', {
  desc = 'Use q to close the window',
  group = augroup,
  pattern = {'qf', 'help', 'man', 'lspinfo', 'harpoon', 'null-ls-info'},
  command = 'nnoremap <buffer> q <cmd>quit<cr>'
})

-- automatic set filetype base extension
vim.cmd([[
  augroup vimrcExtension
    autocmd!

    " When editing a file, always jump to the last known cursor position.
    " Don't do it for commit messages, when the position is invalid, or when
    " inside an event handler (happens when dropping a file on gvim).
    autocmd BufReadPost *
      \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal g`\"" |
      \ endif

    " Set syntax highlighting for specific file types
    autocmd BufRead,BufNewFile *.md set filetype=markdown
    autocmd BufRead,BufNewFile .{jscs,jshint,eslint}rc set filetype=json
    autocmd BufRead,BufNewFile aliases.local,zshrc.local,*/zsh/configs/* set filetype=sh
    autocmd BufRead,BufNewFile gitconfig.local set filetype=gitconfig
    autocmd BufRead,BufNewFile tmux.conf.local set filetype=tmux
    autocmd BufRead,BufNewFile vimrc.local set filetype=vim

    autocmd FileType markdown setlocal spell

    " Automatically wrap at 100 characters for Markdown
    autocmd BufRead,BufNewFile *.md setlocal textwidth=100

    " Automatically wrap at 100 characters and spell check git commit messages
    autocmd FileType gitcommit setlocal textwidth=100
    autocmd FileType gitcommit setlocal spell

    " Allow stylesheets to autocomplete hyphenated words
    autocmd FileType css,scss,sass,less setlocal iskeyword+=-
  augroup END
]])

-- Only show cursorline in the current window and in normal mode.
vim.cmd([[
  augroup cline
      au!
      au WinLeave * set nocursorline
      au WinEnter * set cursorline
      au InsertEnter * set nocursorline
      au InsertLeave * set cursorline
  augroup END
]])
