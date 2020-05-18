
call plug#begin('~/.config/nvim/plugged')

""" Theme / Pretty stuff
"""
" [1]
Plug 'altercation/vim-colors-solarized'
Plug 'endel/vim-github-colorscheme'
" Awesome looking meta at bottom
" Fugitive will help with git related stuff, and show branch on statusline
Plug 'tpope/vim-fugitive' | Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
""

""" Some ESSENTIAL IDE like plugins for Vim
"""
" [2] File tree viewer
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Auto root folder switcher
Plug 'airblade/vim-rooter'

" [3]
" Several plugins to help work with Tmux
Plug 'christoomey/vim-tmux-navigator'
Plug 'https://github.com/christoomey/vim-tmux-runner'
Plug 'christoomey/vim-run-interactive'

" [5] Code highlighting and linting
Plug 'pangloss/vim-javascript' | Plug 'mxw/vim-jsx'

" [6] Adds a ; at the end of a line by pressing <leader> ;
Plug 'lfilho/cosco.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --no-bash' }
Plug 'junegunn/fzf.vim'

" [7]
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'jiangmiao/auto-pairs' "MANY features, but mostly closes ([{' etc
Plug 'vim-scripts/HTML-AutoCloseTag' "close tags after >
Plug 'tpope/vim-repeat' "allow plugins to utilize . command
Plug 'tpope/vim-surround' "easily surround things...just read docs for info
Plug 'vim-scripts/matchit.zip' " % also matches HTML tags / words / etc
Plug 'duff/vim-scratch' "Open a throwaway scratch buffer
Plug 'cakebaker/scss-syntax.vim'
Plug 'ap/vim-css-color'
""

""" Utilities / Extras / Etc
"""
" [8] Diary, notes, whatever. It's amazing
Plug 'vimwiki/vimwiki'

" Opens a browser to preview markdown files
Plug 'suan/vim-instant-markdown', {'do': 'npm install -g instant-markdown-d'}
""

" [9]
Plug 'SirVer/ultisnips' | Plug 'justinj/vim-react-snippets' | Plug 'colbycheeze/vim-snippets'

" [10]
" supertab makes tab work with autocomplete and ultisnips
Plug 'ervandew/supertab'
" For YouCompleteMe, have you installed using:
" ./install.py --tern-completer
" Provides Async autocomplete with T
" if has('nvim')
"   Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" else
"   Plug 'Shougo/deoplete.nvim'
"   Plug 'roxma/nvim-yarp'
"   Plug 'roxma/vim-hug-neovim-rpc'
" endif
" IDE like code intelligence for Javascript
Plug 'ternjs/tern_for_vim', {'do': 'npm install'}

" Reads any .editorconfig files and sets spacing etc automatically
Plug 'editorconfig/editorconfig-vim'

" [11]
Plug 'vim-ruby/vim-ruby'

" [12]
" Goto define fuction
Plug 'universal-ctags/ctags'

" [13]
" Mapping key for Glog, cnext -> ]q, cprev -> [q
" Plug 'tpope/vim-unimpaired'

" [14]
" Vim highlight for Vue
Plug 'posva/vim-vue'

" [15]
" Vim highlight for Vue
Plug 'terryma/vim-multiple-cursors'

Plug 'tpope/vim-rails'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-bundler'
Plug 'thoughtbot/vim-rspec'
Plug 'tpope/vim-commentary'
noremap <Leader>/ :Commentary<CR>

" post install (yarn install | npm install)
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

"Show icon file in NERDTREE
Plug 'ryanoasis/vim-devicons'



""" TODO / Plugins to evaluate
" Figure out how to change matchit to ALSO use <tab>
" Plug 'junegunn/vim-easy-align'
call plug#end()

"""" PLUGIN RELATED TWEAKS
""
"

" [1]
" Color scheme
syntax on
" let g:solarized_termcolors=16
let g:colarized_termtrans = 1
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
set background=light
colorscheme solarized
" Allow powerline symbols to show up
let g:airline_powerline_fonts = 1

" Fugitive mapping
nmap <leader>gb :Gblame<cr>
nmap <leader>gc :Gcommit<cr>
nmap <leader>gd :Gdiff<cr>
nmap <leader>gg :Ggrep
nmap <leader>gl :Glog<cr>
nmap <leader>gp :Git pull<cr>
nmap <leader>gP :Git push<cr>
nmap<leader>gs :Gstatus<cr>
nmap <leader>gw :Gbrowse<cr>

" [2]
map - :NERDTreeToggle<cr>
nnoremap <C-t> :call ToggleRelativeOn()<cr>
nmap = :NERDTreeFind<CR>
" Close vim if only NERDTree is open
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.pyc$', '^__pycache__$', '^.DS_Store$', '.byebug_history']
let g:NERDTreeChDirMode=2
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeNodeDelimiter = "\u00a0"
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite

" Auto change root of the project
let g:rooter_change_directory_for_non_project_files = 'current'
let g:rooter_patterns = ['Cargo.tom', 'package.json', '.git/']
let g:rooter_silent_chdir = 1

" [3]
" Allow moving around between Tmux windows
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
let g:tmux_navigator_no_mappings = 1
let g:tmux_navigator_save_on_switch = 1
"
"Open a tmux pane with Node
nnoremap <leader>node :VtrOpenRunner {'orientation': 'h', 'percentage': 50, 'cmd': 'node'}<cr>

" [5]
" Setup for NEOMAKE plugin ~~~~~~~
" let g:neomake_scss_csslint_maker = ['sass-lint']
" let g:neomake_javascript_enabled_makers = ['eslint']
" let g:neomake_open_list = 0
" let g:neomake_warning_sign = {
"       \ 'texthl': 'WarningMsg',
"       \ }
"
" let g:neomake_error_sign = {
"       \ 'texthl': 'ErrorMsg',
"       \ }
" autocmd! BufWritePost,BufEnter * Neomake
"       ~~~~~~~~~~~~~~~~
" configure syntastic syntax checking to check on open as well as save
" let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
" let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': ['javascript'], 'passive_filetypes': [] }

" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" " " Syntastic will search for an .eslintrc in your project, otherwise it defaults
" autocmd FileType javascript let b:syntastic_checkers = findfile('.eslintrc', '.;') != '' ? ['eslint'] : ['standard']
" " these 2 lines check to see if eslint is installed via local npm and runs that before going global
" let s:eslint_path = system('PATH=$(npm bin):$PATH && which eslint')
" let b:syntastic_javascript_eslint_exec = substitute(s:eslint_path, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')
" " " Allow highlighting of HTML within Javascript (for React)
" let g:javascript_enable_domhtmlcss = 1
" let g:jsx_ext_required = 0

" [6] Key mapping for Cosco.vim - space + ; to add semicolon or comma in Javascript or CSS
autocmd FileType javascript,css nnoremap <silent> <Leader>; :call cosco#commaOrSemiColon()<CR>
autocmd FileType javascript,css inoremap <silent> <Leader>; <c-o>:call cosco#commaOrSemiColon()<CR>

" Map key with fzf
nmap <Leader>F :GFiles<CR>
nmap <Leader>f :Files<CR>
nmap <Leader>b :Buffers<CR>
nmap <Leader>h :History<CR>
nmap <Leader>t :BTags<CR>
nmap <Leader>T :Tags<CR>

" Search keyword within file
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-hidden --ignore-case --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
  \           : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%:hidden', '?'),
  \   <bang>0)
nnoremap <C-f> :Rg<Cr>

" Customize fzf open file
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }
" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Red'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" [7]
" " coc config
" TDB

" [8] Set Vim Wiki to my Dropbox directory
let g:vimwiki_list = [{'path':'$HOME/Dropbox/vimwiki'}]
" Configuration for instant-markdown
let g:instant_markdown_autostart = 0
map <Leader>md :InstantMarkdownPreview<CR>

" [9]
" Set ultisnips triggers
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical"

" [10] make YCM compatible with UltiSnips (using supertab)
let g:SuperTabDefaultCompletionType = '<C-n>'

" let g:deoplete#enable_at_startup = 1
" if !exists('g:deoplete#omni#input_patterns')
"   let g:deoplete#omni#input_patterns = {}
" endif
" autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" [11]
" vim-ruby
let g:ruby_indent_access_modifier_style = 'normal'
let g:ruby_indent_assignment_style = 'variable'
let g:ruby_indent_block_style = 'do'

" omnifuncs
augroup omnifuncs
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup end

" tern
if exists('g:plugs["tern_for_vim"]')
  let g:tern_show_argument_hints = 'on_hold'
  let g:tern_show_signature_in_pum = 1
  let g:tern_map_keys = 1

  autocmd FileType javascript setlocal omnifunc=tern#Complete
endif

"set up path to editorconfig
let g:EditorConfig_exec_path = findfile('.editorconfig', '.;')

" Not sure what the below code does...look into Tern docs etc and figure it out?
" Found this snippet on a forum post that says it gets everything working
" https://github.com/Valloric/YouCompleteMe/issues/570
" autocmd FileType javascript setlocal omnifunc=tern#Complete

" " Run commands that require an interactive shell
" nnoremap <Leader>r :RunInInteractiveShell<space>
"

" [14]
" Disable pre processor vue highlighting
let g:vue_disable_pre_processors=1

" [15]
" multiple cursor
let g:multi_cursor_exit_from_visual_mode=0
let g:multi_cursor_exit_from_insert_mode=0
