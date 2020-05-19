
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
" Plug 'lfilho/cosco.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --no-bash' }
Plug 'junegunn/fzf.vim'

" [7]
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-denite'
Plug 'Shougo/denite.nvim'

" Plug 'jiangmiao/auto-pairs' "MANY features, but mostly closes ([{' etc
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
" Plug 'ervandew/supertab'

" IDE like code intelligence for Javascript
Plug 'ternjs/tern_for_vim', {'do': 'npm install'}
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

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
" Plug 'tpope/vim-endwise' "add end in ruby, endfunction/endif/more in vim script
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
let g:rooter_patterns = ['Cargo.tom', 'package.json', '.git/', 'Gemfile']
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
" autocmd FileType javascript,css nnoremap <silent> <Leader>; :call cosco#commaOrSemiColon()<CR>
" autocmd FileType javascript,css inoremap <silent> <Leader>; <c-o>:call cosco#commaOrSemiColon()<CR>

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
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<tab>"
" let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
" let g:UltiSnipsEditSplit="vertical"

" [10] make YCM compatible with UltiSnips (using supertab)
" let g:SuperTabDefaultCompletionType = '<C-n>'


" vim-go plugin specific commands
" Also run `goimports` on your current file on every save
" Might be be slow on large codebases, if so, just comment it out
let g:go_fmt_command = "goimports"
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0
let g:go_code_completion_enabled = 0

" Status line types/signatures.
let g:go_auto_type_info = 1

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

" -------------------------------------------------------------------------------------------------
" coc.nvim default settings
" -------------------------------------------------------------------------------------------------
" if hidden is not set, TextEdit might fail.
set hidden

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

let g:coc_status_error_sign=" "
let g:coc_status_warning_sign=" "

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>



" ==============
" DENITE
call denite#custom#var('file/rec', 'command', ['rg', '--files', '--glob', '!.git'])
call denite#custom#var('grep', 'command', ['rg'])
call denite#custom#var('grep', 'default_opts', ['--hidden', '--vimgrep', '--heading', '-S'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])
call denite#custom#source('grep', 'converters', ['converter/abbr_word'])
call denite#custom#option('_', 'max_dynamic_update_candidates', 100000)
call denite#custom#var('outline', 'command', ['ctags'])
" Tell ctags write tags to stdin, so Denite can pick it up
call denite#custom#var('outline', 'options', ['-f -', '--excmd=number'])

let s:denite_options = {
      \ 'prompt' : '',
      \ 'split': 'floating',
      \ 'start_filter': 1,
      \ 'auto_resize': 1,
      \ 'source_names': 'short',
      \ 'direction': 'botright',
      \ 'statusline': 0,
      \ 'cursorline': 0,
      \ 'highlight_matched_char': 'WildMenu',
      \ 'highlight_matched_range': 'WildMenu',
      \ 'highlight_window_background': 'Visual',
      \ 'highlight_filter_background': 'CocListMagentaGray',
      \ 'highlight_preview_line': 'Cursor',
      \ 'vertical_preview': 1
      \ }

call denite#custom#option('default', s:denite_options)

autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
    nnoremap <silent><buffer><expr> <CR>
                \ denite#do_map('do_action')
    nnoremap <silent><buffer><expr> d
                \ denite#do_map('do_action', 'delete')
    nnoremap <silent><buffer><expr> <c-p>
                \ denite#do_map('do_action', 'preview')
    nnoremap <silent><buffer><expr> q
                \ denite#do_map('quit')
    nnoremap <silent><buffer><expr> i
                \ denite#do_map('open_filter_buffer')
    nnoremap <silent><buffer><expr> <c-a>
                \ denite#do_map('toggle_select_all')
    nnoremap <silent><buffer><expr> <c-t>
                \ denite#do_map('toggle_select').'j'
endfunction

autocmd FileType denite-filter call s:denite_filter_my_settings()
function! s:denite_filter_my_settings() abort
    imap <silent><buffer> <tab> <Plug>(denite_filter_quit)
    inoremap <silent><buffer><expr> <CR> denite#do_map('do_action')
    inoremap <silent><buffer><expr> <c-a>
                \ denite#do_map('toggle_select_all')
    inoremap <silent><buffer><expr> <c-t>
                \ denite#do_map('toggle_select')
    inoremap <silent><buffer><expr> <c-o>
                \ denite#do_map('do_action', 'quickfix')
    inoremap <silent><buffer><expr> <esc>
                \ denite#do_map('quit')
    inoremap <silent><buffer> <C-j>
                \ <Esc><C-w>p:call cursor(line('.')+1,0)<CR><C-w>pA
    inoremap <silent><buffer> <C-k>
                \ <Esc><C-w>p:call cursor(line('.')-1,0)<CR><C-w>pA
endfunction

nnoremap \ :Denite grep<CR>
nnoremap <Leader>pf :Denite file/rec<CR>
nnoremap <Leader>pr :Denite file/old buffer<CR>
nnoremap <C-o> :Denite outline<CR>
map * :Denite -resume -refresh<CR>
