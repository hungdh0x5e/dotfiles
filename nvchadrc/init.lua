vim.opt.textwidth = 120
vim.opt.list = true
vim.opt.listchars = { tab = "▸ ", trail = "·", nbsp = "·" }
vim.opt.relativenumber = true

-- Automatically :write before running commands
vim.opt.autowrite = true

-- Reload files changed outside vim
vim.opt.autoread = true

-- Keep lines below cursor when scrolling
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 15

-- Persistent undo
-- Don't forget mkdir folder $HOME/.vim/undo
-- vim.opt.undofile = true
-- vim.opt.undodir = HOME .. '/.config/nvim/undo'
-- vim.opt.undolevels = 1000
-- vim.opt.undoreload = 10000

-- Trigger `autoread` when files changes on disk
vim.cmd("autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif")
vim.cmd(
	'autocmd FileChangedShellPost * echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None'
)
vim.cmd("au FocusGained,BufEnter * :silent! !")

-- highlight the number current line
vim.cmd([[
  hi CursorLineNr cterm=bold ctermbg=NONE ctermfg=red
  augroup CLNRSet
    autocmd! ColorScheme * hi CursorLineNr cterm=bold ctermbg=NONE ctermfg=red
  augroup END
]])

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
    autocmd BufRead,BufNewFile Dockerfile* set filetype=dockerfile

    " Allow stylesheets to autocomplete hyphenated words
    autocmd FileType css,scss,sass,less setlocal iskeyword+=-
  augroup END
]])

require("custom.autocmds")
