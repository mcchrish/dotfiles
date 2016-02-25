"===============================================================================
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"
" Neovim init.vim
"
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"===============================================================================

" Leader
let mapleader = "\<space>"

" ##Plugins {{{

call plug#begin('~/.config/nvim/plugged')

if has('nvim')

" deoplete.nvim {{{
Plug 'Shougo/deoplete.nvim'

let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_auto_pairs = 0

if !exists('g:deoplete#keyword_patterns')
  let g:deoplete#keyword_patterns = {}
endif

let g:deoplete#keyword_patterns['default'] = '\h\w*'

if !exists('g:deoplete#omni_patterns')
  let g:deoplete#omni_patterns = {}
endif

let g:deoplete#omni_patterns.python = '[^. \t]\.\w*\|from .* import \w*'

" }}}

endif

if !has('gui_running')

" fzf {{{
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

let g:fzf_command_prefix = 'Fzf'
let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit' }

let g:fzf#vim#default_layout = {'down': '~40%'}

" Search all file content including hidden files and directories
command! -nargs=* FzfAgAll call fzf#vim#ag(<q-args>,
      \ '--hidden --path-to-agignore="'.$XDG_CONFIG_HOME.'/ag/fzfignore"',
      \ { 'options': '--ansi --delimiter : --nth 4..,.. --prompt "AgAll> " '.
      \            '--multi --bind ctrl-a:select-all,ctrl-d:deselect-all '.
      \            '--color hl:68,hl+:110', 'down': '~40%' })

nnoremap <silent> <leader>A :FzfAgAll<cr>

nnoremap <silent> <leader>f :FzfFiles<cr>
nnoremap <silent> <leader>a :FzfAg<cr>
nnoremap <silent> <leader>b :FzfBuffers<cr>
nnoremap <silent> <leader>l :FzfBLines<cr>
nnoremap <silent> <leader>L :FzfLines<cr>
nnoremap <silent> <leader>m :FzfMarks<cr>
nnoremap <silent> K :call SearchWordWithAg()<cr>
vnoremap <silent> K :call SearchVisualSelectionWithAg()<cr>

imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <C-x><C-f> <plug>(fzf-complete-file-ag)
imap <C-x><C-l> <plug>(fzf-complete-line)

" }}}

endif

" neomake {{{
Plug 'benekastah/neomake'

let g:neomake_javascript_enabled_makers = ['standard']
let g:neomake_jsx_enabled_makers        = ['standard']
let g:neomake_python_enabled_makers     = ['flake8']
let g:neomake_less_enabled_makers       = []
let g:neomake_shell_enabled_makers      = ['shellcheck']
let g:neomake_html_enabled_makers       = []
let g:neomake_open_list                 = 0
let g:neomake_verbose                   = 0

let g:neomake_error_sign = {
      \ 'text': '✖',
      \ 'texthl': 'SyntasticErrorSign',
      \ }

let g:neomake_warning_sign = {
      \ 'text': '⚠',
      \ 'texthl': 'SyntasticWarningSign',
      \ }
" }}}

" vim-fugitive {{{
Plug 'tpope/vim-fugitive'
nnoremap <silent> <leader>gs :Gstatus<cr>
nnoremap <silent> <leader>gd :Gdiff<cr>
nnoremap <silent> <leader>gb :Gblame<cr>
" }}}

Plug 'junegunn/gv.vim', { 'on': 'GV' }

" ultisnips {{{
" Plug 'SirVer/ultisnips' | Plug 'mcchrish/vim-snippets'

let g:UltiSnipsExpandTrigger       = "<tab>"
let g:UltiSnipsJumpForwardTrigger  = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

let g:UltiSnipsUsePythonVersion = 3
" }}}

" echodoc.vim {{{
Plug 'Shougo/echodoc.vim'
let g:echodoc_enable_at_startup = 1
" }}}

Plug 'nhooyr/neoman.vim', { 'on': 'Nman' }

Plug 'christoomey/vim-tmux-navigator'

" vim-dirvish {{{
Plug 'justinmk/vim-dirvish'

let g:dirvish_hijack_netrw   = 1
let g:dirvish_relative_paths = 1
" }}}

" vim-gtfo {{{
Plug 'justinmk/vim-gtfo'
let g:gtfo#terminals = { 'mac' : 'iterm' }
" }}}

" vim-sneak {{{
Plug 'justinmk/vim-sneak'
let g:sneak#streak     = 1
let g:sneak#use_ic_scs = 1

"replace 'f' with 1-char Sneak
nmap f <Plug>Sneak_f
nmap F <Plug>Sneak_F
xmap f <Plug>Sneak_f
xmap F <Plug>Sneak_F
omap f <Plug>Sneak_f
omap F <Plug>Sneak_F
"replace 't' with 1-char Sneak
nmap t <Plug>Sneak_t
nmap T <Plug>Sneak_T
xmap t <Plug>Sneak_t
xmap T <Plug>Sneak_T
omap t <Plug>Sneak_t
omap T <Plug>Sneak_T

nmap <expr> ; sneak#is_sneaking() ? '<Plug>SneakNext' : ':'
vmap <expr> ; sneak#is_sneaking() ? '<Plug>SneakNext' : ':'
" }}}

Plug 'pgdouyon/vim-evanesco'

" vim-easy-align {{{
Plug 'junegunn/vim-easy-align', { 'on': '<plug>(LiveEasyAlign)' }
xmap ga <Plug>(LiveEasyAlign)
nmap ga <Plug>(LiveEasyAlign)
" }}}

" FastFold {{{
Plug 'Konfekt/FastFold'
let g:fastfold_force = 1
" }}}

" vim-qf {{{
Plug 'romainl/vim-qf'
let g:qf_mapping_ack_style = 1
" }}}

Plug 'wellle/targets.vim'

" undotree {{{
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }

let g:undotree_WindowLayout       = 2
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_SplitWidth         = 40

nnoremap <silent> <leader>u :UndotreeToggle<cr>
" }}}

" vim-signature {{{
Plug 'kshenoy/vim-signature'
nnoremap <silent> <leader>' :SignatureToggleSigns<cr>
" }}}

" lightline.vim {{{
Plug 'itchyny/lightline.vim'

let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive' ], [ 'filename' ] ],
      \   'right': [ [ 'neomake', 'percent', 'lineinfo' ], [ 'filetype' ], [ 'fileformat', 'fileencoding' ] ]
      \ },
      \ 'component': {
      \   'lineinfo': ' %3l:%-2v'
      \ },
      \ 'component_expand': {
      \   'neomake': 'neomake#statusline#LoclistStatus'
      \ },
      \ 'component_type': {
      \   'neomake': 'error'
      \ },
      \ 'component_function': {
      \   'readonly': 'LightLineReadonly',
      \   'fugitive': 'LightLineFugitive',
      \   'mode': 'LightLineMode',
      \   'filename': 'LightLineFilename',
      \   'fileformat': 'LightLineFileformat',
      \   'filetype': 'LightLineFiletype',
      \   'fileencoding': 'LightLineFileencoding'
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' },
      \ 'tabline_separator': { 'left': '', 'right': '' },
      \ 'tabline_subseparator': { 'left': '|', 'right': '|' },
      \ }

let s:except_ft = 'help\|qf\|undotree\|fzf\|vim-plug'
function! LightLineReadonly()
  return &ft !~? s:except_ft && &readonly ? '' : ''
endfunction

function! LightLineModified()
  return &ft =~ s:except_ft ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightLineFugitive()
  if &ft !~? s:except_ft && exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? ' '._ : ''
  endif
  return ''
endfunction

function! LightLineMode()
  return &ft == 'help' ? 'help' :
        \ &ft == 'undotree' ? 'undotree' :
        \ &ft == 'fzf' ? 'fzf' :
        \ &ft == 'vim-plug' ? 'plugin' :
        \ &ft == 'qf' ? 'quickfix' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! LightLineFilename()
  let fname = expand('%:f')
  return &ft =~ s:except_ft ? '' :
        \ ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ ('' != fname ? fname : '[No Name]') .
        \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineFileformat()
  return winwidth(0) > 90 && &ft !~? s:except_ft ? &fileformat : ''
endfunction

function! LightLineFiletype()
  return winwidth(0) > 90  && &ft !~? s:except_ft ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding()
  return winwidth(0) > 90  && &ft !~? s:except_ft ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

let g:lightline.mode_map = {
      \ 'n' : 'N',
      \ 'i' : 'I',
      \ 'R' : 'R',
      \ 'v' : 'V',
      \ 'V' : 'VL',
      \ 'c' : 'C',
      \ "\<C-v>": 'VB',
      \ 's' : 'SELECT',
      \ 'S' : 'S-LINE',
      \ "\<C-s>": 'S-BLOCK',
      \ '?': '      ' }
" }}}

" vim-gitgutter {{{
Plug 'airblade/vim-gitgutter', { 'on': 'GitGutterToggle' }

let g:gitgutter_max_signs    = 200
let g:gitgutter_realtime     = 0
let g:gitgutter_eager        = 0
let g:gitgutter_grep_command = 'ag --nocolor'

nnoremap <silent> <F3> :GitGutterToggle<cr>
"}}}

Plug 'tomtom/tcomment_vim'

Plug 'rstacruz/vim-closer'

Plug 'tpope/vim-surround'

Plug 'tpope/vim-rsi'

Plug 'tpope/vim-sleuth'

Plug 'tpope/vim-unimpaired'

Plug 'tpope/vim-repeat'

Plug 'tpope/vim-eunuch'

Plug 'tpope/vim-endwise'

Plug 'rizzatti/dash.vim', { 'on': 'Dash' }

" goyo.vim {{{
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
nnoremap <silent> <leader>- :Goyo<cr>
" }}}

" limelight.vim {{{
Plug 'junegunn/limelight.vim', { 'on': 'Limelight' }

let g:limelight_conceal_guifg   = 'DarkGray'
let g:limelight_conceal_ctermfg = 'gray'
" }}}

" vim-pencil {{{
Plug 'reedes/vim-pencil', { 'for': ['fountain', 'markdown', 'text'] }
let g:pencil#wrapModeDefault = 'soft'
" }}}

Plug 'othree/yajs.vim', { 'for': ['javascript', 'javascript.jsx', 'jsx', 'html'] }

Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx', 'jsx'] }

" javascript-libraries-syntax.vim {{{
Plug 'othree/javascript-libraries-syntax.vim', { 'for': ['javascript', 'javascript.jsx', 'jsx'] }
let g:used_javascript_libs = 'jquery,underscore,react'
" }}}

Plug 'gavocanov/vim-js-indent', { 'for': ['javascript', 'javascript.jsx', 'jsx'] }

" tern_for_vim {{{
Plug 'marijnh/tern_for_vim', { 'do': 'npm install && npm update', 'for': ['javascript', 'javascript.jsx' , 'jsx'] }
nnoremap <silent> <leader>td :TernDef<cr>
nnoremap <silent> <leader>ts :TernDefSplit<cr>
" }}}

Plug 'tpope/vim-jdaddy', { 'for': ['javascript', 'javascript.jsx', 'jsx', 'json' ] }

Plug 'othree/html5.vim', { 'for': 'html' }

" emmet-vim {{{
Plug 'mattn/emmet-vim'

let g:user_emmet_install_global = 1
let g:user_emmet_leader_key     = '<C-A>'
let g:user_emmet_settings       = { 'javascript': { 'quote_char': "'" } }
" }}}

" vim-mustasche-handlebars {{{
Plug 'mustache/vim-mustache-handlebars', { 'for': ['html', 'mustasche', 'handlebar'] }
let g:mustache_abbreviations = 1
" }}}

Plug 'hail2u/vim-css3-syntax', { 'for': [ 'sass', 'scss', 'css', 'less' ] }

Plug 'ap/vim-css-color', { 'for': [ 'sass', 'scss', 'css', 'less' ] }

Plug 'rstacruz/vim-hyperstyle', { 'for': [ 'sass', 'scss', 'css', 'less' ] }

Plug 'groenewege/vim-less', { 'for': 'less' }

Plug 'zchee/deoplete-jedi', { 'for': 'python' }

" python-syntax {{{
Plug 'hdima/python-syntax', { 'for': 'python' }
let python_highlight_all = 1
" }}}

Plug 'hynek/vim-python-pep8-indent', { 'for': 'python' }

Plug 'mcchrish/fountain.vim', { 'for': 'fountain' }

" gruvbox {{{
Plug 'morhetz/gruvbox'
set background=dark

" dark0 + gray
let g:terminal_color_0  = "#928374"
let g:terminal_color_8  = "#282828"

" neurtral_red + bright_red
let g:terminal_color_1  = "#fb4934"
let g:terminal_color_9  = "#cc241d"

" neutral_green + bright_green
let g:terminal_color_2  = "#b8bb26"
let g:terminal_color_10 = "#98971a"

" neutral_yellow + bright_yellow
let g:terminal_color_3  = "#fabd2f"
let g:terminal_color_11 = "#d79921"

" neutral_blue + bright_blue
let g:terminal_color_4  = "#83a598"
let g:terminal_color_12 = "#458588"

" neutral_purple + bright_purple
let g:terminal_color_5  = "#d3869b"
let g:terminal_color_13 = "#b16286"

" neutral_aqua + faded_aqua
let g:terminal_color_6  = "#8ec07c"
let g:terminal_color_14 = "#689d6a"

" light4 + light1
let g:terminal_color_7  = "#ebdbb2"
let g:terminal_color_15 = "#a89984"
" }}}

" Alduin {{{
Plug 'AlessandroYorba/Alduin'
let g:alduin_Shout_Windhelm = 1
"}}}

" Sierra {{{
Plug 'AlessandroYorba/Sierra'
" }}}

call plug#end()
" }}}

" ##On plugin loaded {{{

" Load immediately so we can override keymappings later
runtime! plugin/unimpaired.vim

nmap <silent> [q <Plug>QfCprevious
nmap <silent> ]q <Plug>QfCnext
nmap <silent> [l <Plug>QfLprevious
nmap <silent> ]l <Plug>QfLnext

" vim-signature
let g:SignatureEnabledAtStartup = 0

" }}}

" ##Basics {{{

" Colorscheme
colorscheme gruvbox

" Disable some builtin plugins
let g:loaded_2html_plugin       = 1
let g:loaded_vimballPlugin      = 1
let g:loaded_rrhelper           = 1
let g:loaded_getscriptPlugin    = 1
let g:did_install_default_menus = 1
let g:loaded_zipPlugin          = 1
let g:loaded_tarPlugin          = 1
let g:loaded_gzip               = 1

let g:python_host_skip_check  = 1
let g:python3_host_skip_check = 1
let g:python_host_prog        = '/usr/local/bin/python2.7'
let g:python3_host_prog       = '/usr/local/bin/python3'

set modelines=1
set autoread
set fileformats=unix,mac,dos
set fileformat=unix
set encoding=utf-8
set ttimeout
set ttimeoutlen=100
set backspace=indent,eol,start
set smarttab
set showcmd
set number
set hlsearch incsearch
set ignorecase smartcase
set lazyredraw
set laststatus=2
set breakindent
set showmatch
set autoindent
let &showbreak="↪︎ "
set shortmess=aIToO

" Change window title to filename
set title

" Better splitting
set splitbelow
set splitright

" Diff Mode
set diffopt=filler,vertical

" Sytem clipboard for yanking
set clipboard=unnamed

" Mode shown by statusline
set noshowmode

" Easy buffer switching
set hidden

" Default shell
set shell=$SHELL

set scrolloff=4
set sidescrolloff=5
set synmaxcol=500
set history=1000
set tabpagemax=50

" Start with open folds
set foldlevelstart=99

" No bells
set noerrorbells novisualbell
set nojoinspaces

" Nicer vertical splits
let &fillchars='vert: ,fold:·'
let &listchars='tab:| ,eol:¬,trail:⣿,extends:❯,precedes:❮'

" Better Completion
set completeopt-=preview
set completeopt+=menuone

" Indentation, 2 spaces no tabs
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab

" Wrapping
set wrap
set linebreak
set textwidth=80
set formatoptions=cqj1 " format using textwidth, including comments and gq

" Stay on the same column if possible
set nostartofline

" Menu complete
set wildmenu
set wildignorecase
set wildmode=longest:full,full
set wildignore+=.hg,.git,.svn,*.pyc,*.spl,*.o,*.out,*.DS_Store
set wildignore+=*/node_modules/*

" True color
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Neovim bug workaround
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" Persistent undo and swap files directory
set undofile

" Change vim temporary directories
if !has('nvim')
  set noswapfile

  set undodir=~/.vim/tmp/undo//
  set backupdir=~/.vim/tmp/backup//

  set viminfo+=n~/.vim/viminfo
endif

" }}}

"  ##Keymapping {{{

" Move vertically by visual line
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap gj j
nnoremap gk k

" More scroll
nnoremap <c-y> 4<c-y>
nnoremap <c-e> 4<c-e>

" Reselect indent in visual mode
vnoremap < <gv
vnoremap > >gv

" Easy reindenting
nnoremap g= gg=Gg``

" Remap esc
inoremap jk <esc>

" Move in insert mode
inoremap <C-h> <C-o>h
inoremap <C-l> <C-o>a
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k
inoremap <C-^> <C-o><C-^>

" No ex mode
nnoremap Q <nop>

" Fix mistypes when quiting
cabbrev Wq wq
cabbrev W w
cabbrev Q q

" Toggle relativenumber
nnoremap <F1> :set relativenumber!<cr>

" Faster save
nnoremap <leader>w :update<cr>

" Delete without overwriting default register
nnoremap vd "_d
xnoremap x  "_d
nnoremap vD "_D

" Actual Y
nnoremap Y y$

" Buffer navigation
nnoremap <tab>   :bnext<cr>
nnoremap <s-tab> :bprevious<cr>

" Paste mode
set pastetoggle=<F2>

" Edit vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" JS standard formatter
nnoremap <leader>ej :silent !standard-format % --write<cr>

" Preview Marked 2
nnoremap <F10> :silent !open -a Marked\ 2.app '%:p'<cr>

" Hightlight 80 characters
nnoremap <silent> <leader>h
      \ :if exists('w:long_line_match') <bar>
      \   silent! call matchdelete(w:long_line_match) <bar>
      \   unlet w:long_line_match <bar>
      \ elseif &textwidth > 0 <bar>
      \   let w:long_line_match = matchadd('ErrorMsg', '\%>'.&tw.'v.\+', -1) <bar>
      \ else <bar>
      \   let w:long_line_match = matchadd('ErrorMsg', '\%>80v.\+', -1) <bar>
      \ endif<cr>

" }}}

" ##Functions {{{

" StripTrailingWhitespaces {{{
function! <sid>StripTrailingWhitespaces()
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  %s/\s\+$//e
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
  echo 'Whitespace trimmed!'
endfunction

nnoremap <silent> <F4> :call <sid>StripTrailingWhitespaces()<cr>
" }}}

" SearchWordWithAg {{{
function! SearchWordWithAg()
  execute 'FzfAg' expand('<cword>')
endfunction
" }}}

" SearchVisualSelectionWithAg {{{
function! SearchVisualSelectionWithAg() range
  let old_reg = getreg('"')
  let old_regtype = getregtype('"')
  let old_clipboard = &clipboard
  set clipboard&
  normal! ""gvy
  let selection = getreg('"')
  call setreg('"', old_reg, old_regtype)
  let &clipboard = old_clipboard
  execute 'FzfAg' selection
endfunction
" }}}

" Refresh {{{
function! Refresh()
  checktime
  redraw
  call lightline#update()
  echo 'Refreshed!'
endfunction

" Remove search highlight
nnoremap <silent> <leader><cr> :nohlsearch <bar> :call Refresh()<cr>
" }}}

" SetAsDjangoProject {{{
function! SetAsDjangoProject()
  augroup ft_django
    autocmd BufNewFile,BufRead *.html setlocal filetype=htmldjango
    autocmd FileType html,htmldjango setlocal foldmethod=indent
    autocmd FileType html,htmldjango setlocal nofoldenable
    autocmd BufNewFile,BufRead *.py setlocal filetype=python.django
  augroup end
endfunction
" }}}

" SetAsMeteorProject {{{
function! SetAsMeteorProject()
  augroup meteor
    au!
    autocmd BufNewFile,BufRead *.html setlocal filetype=html.mustache
  augroup end
endfunction
" }}}

" }}}

" ##Autocmd {{{

" Resize splits when the window is resized
autocmd VimResized * :wincmd =

autocmd! BufWritePost * Neomake
autocmd! BufRead      * Neomake

augroup pencil
  autocmd!
  autocmd FileType fountain,mardown,text call pencil#init()
  autocmd FileType fountain              setlocal showbreak=
augroup end

function! s:goyo_enter()
  silent !tmux set status off
endfunction

function! s:goyo_leave()
  silent !tmux set status on
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

augroup general
  autocmd!
  autocmd BufWritePre *.py,*.js,*.jsx,*.txt,*.md,*.fountain :call <sid>StripTrailingWhitespaces()
  autocmd FileType javascript         setlocal omnifunc=tern#Complete
  autocmd FileType python             setlocal omnifunc=jedi#completions
augroup end
" }}}

" ##Local {{{

" Detect Django project
if filereadable(glob("manage.py"))
  call SetAsDjangoProject()
endif

" Detect Meteor project
if filereadable(glob(".meteor/versions"))
  call SetAsMeteorProject()
endif

" }}}

" vim:foldmethod=marker:foldlevel=0
