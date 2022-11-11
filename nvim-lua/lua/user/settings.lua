local HOME = os.getenv("HOME")

vim.opt.encoding = 'UTF-8'

-- Clipboard
vim.opt.clipboard = 'unnamed'

-- Enable mouse support
vim.opt.mouse = 'a'

vim.opt.backspace = "indent,eol,start" -- backspace works on every char in insert mode

-- backup files
vim.opt.backup = true
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.backupdir = HOME .. '/.vim/tmp/backup//'
vim.opt.backupcopy = 'yes'
vim.opt.backupskip = '/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*'
vim.opt.directory = '/.vim/tmp/swap//' -- swap files

vim.opt.history = 50

-- show the cursor position all the time
vim.opt.ruler = true

-- display incomplete command
vim.opt.showcmd = true

-- Always display the status line
vim.opt.laststatus = 2

-- Automatically :write before running commands
vim.opt.autowrite = true

-- Reload files changed outside vim
vim.opt.autoread = true


-- Make searching better
vim.opt.smartcase = true
-- Ignore the case when the search pattern is all lowercase
vim.opt.ignorecase = true
vim.opt.hlsearch = true -- highlight search
vim.opt.incsearch = true
vim.opt.showmatch = true

-- Keep lines below cursor when scrolling
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 15

-- Always display signcolumn (for diagnostic related stuff)
vim.opt.signcolumn = 'no'

-- When opening a window put it right or below the current one
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Tab set to two spaces
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true

-- Disable line wrapping
vim.opt.wrap = false
vim.opt.textwidth = 120

-- Insert mode completion setting
vim.opt.completeopt = {'menu', 'menuone'}

-- Display extra whitespace
vim.opt.list = true
vim.opt.listchars = {tab = '▸ ', trail = '·', nbsp = '·'} -- eol = '↲'

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 5

-- Enable cursorline
vim.opt.cursorline = true

-- Persistent undo
-- Don't forget mkdir folder $HOME/.vim/undo
vim.opt.undofile = true
vim.opt.undodir = HOME .. '/.config/nvim/undo'
vim.opt.undolevels = 1000
vim.opt.undoreload = 10000

