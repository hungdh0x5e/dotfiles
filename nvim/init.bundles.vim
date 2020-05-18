
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
Plug 'scrooloose/syntastic' "Run linters and display errors etc
" Plug 'benekastah/neomake' "Async Jobs (can use it instead of syntastic, but hard to setup)
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
Plug 'tpope/vim-unimpaired'

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
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': ['javascript'], 'passive_filetypes': [] }

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" " Syntastic will search for an .eslintrc in your project, otherwise it defaults
autocmd FileType javascript let b:syntastic_checkers = findfile('.eslintrc', '.;') != '' ? ['eslint'] : ['standard']
" these 2 lines check to see if eslint is installed via local npm and runs that before going global
let s:eslint_path = system('PATH=$(npm bin):$PATH && which eslint')
let b:syntastic_javascript_eslint_exec = substitute(s:eslint_path, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')
" " Allow highlighting of HTML within Javascript (for React)
let g:javascript_enable_domhtmlcss = 1
let g:jsx_ext_required = 0

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
" let g:coc_global_extensions = [
"   \ 'coc-snippets',
"   \ 'coc-pairs',
"   \ 'coc-eslint', 
"   \ 'coc-prettier', 
"   \ 'coc-json', 
"   \ ]
" " from readme
" " if hidden is not set, TextEdit might fail.
" set hidden " Some servers have issues with backup files, see #649 set nobackup set nowritebackup " Better display for messages set cmdheight=2 " You will have bad experience for diagnostic messages when it's default 4000.
" set updatetime=300

" " don't give |ins-completion-menu| messages.
" set shortmess+=c

" " always show signcolumns
" set signcolumn=yes

" " Use tab for trigger completion with characters ahead and navigate.
" " Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction

" " Use <c-space> to trigger completion.
" inoremap <silent><expr> <c-space> coc#refresh()

" " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" " Coc only does snippet and additional edit on confirm.
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" " Or use `complete_info` if your vim support it, like:
" " inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" " Use `[g` and `]g` to navigate diagnostics
" nmap <silent> [g <Plug>(coc-diagnostic-prev)
" nmap <silent> ]g <Plug>(coc-diagnostic-next)

" " Remap keys for gotos
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)

" " Use K to show documentation in preview window
" nnoremap <silent> K :call <SID>show_documentation()<CR>

" function! s:show_documentation()
"   if (index(['vim','help'], &filetype) >= 0)
"     execute 'h '.expand('<cword>')
"   else
"     call CocAction('doHover')
"   endif
" endfunction

" " Highlight symbol under cursor on CursorHold
" autocmd CursorHold * silent call CocActionAsync('highlight')

" " Remap for rename current word
" nmap <F2> <Plug>(coc-rename)

" " Remap for format selected region
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)

" augroup mygroup
"   autocmd!
"   " Setup formatexpr specified filetype(s).
"   autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
"   " Update signature help on jump placeholder
"   autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
" augroup end

" " Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
" xmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>a  <Plug>(coc-codeaction-selected)

" " Remap for do codeAction of current line
" nmap <leader>ac  <Plug>(coc-codeaction)
" " Fix autofix problem of current line
" nmap <leader>qf  <Plug>(coc-fix-current)

" " Create mappings for function text object, requires document symbols feature of languageserver.
" xmap if <Plug>(coc-funcobj-i)
" xmap af <Plug>(coc-funcobj-a)
" omap if <Plug>(coc-funcobj-i)
" omap af <Plug>(coc-funcobj-a)

" " Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
" " nmap <silent> <C-d> <Plug>(coc-range-select)
" " xmap <silent> <C-d> <Plug>(coc-range-select)

" " Use `:Format` to format current buffer
" command! -nargs=0 Format :call CocAction('format')

" " Use `:Fold` to fold current buffer
" command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" " use `:OR` for organize import of current buffer
" command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" " Using CocList
" " Show all diagnostics
" nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" " Manage extensions
" nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" " Show commands
" nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" " Find symbol of current document
" nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" " Search workspace symbols
" nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" " Do default action for next item.
" nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" " Do default action for previous item.
" nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" " Resume latest coc list
" nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

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
