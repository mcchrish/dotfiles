"===============================================================================
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"
" Neovim mininit.vim
"
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"===============================================================================

" Leader
let mapleader = "\<space>"

" ##Plugins {{{
" Automatic installation of Vim-Plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')

" vim-fugitive {{{
Plug 'tpope/vim-fugitive'
nnoremap <silent> <leader>gs :Gstatus<cr>
nnoremap <silent> <leader>gd :Gdiff<cr>
nnoremap <silent> <leader>gb :Gblame<cr>
" }}}

Plug 'nhooyr/neoman.vim'

Plug 'christoomey/vim-tmux-navigator'

" vim-sneak {{{
Plug 'justinmk/vim-sneak'
let g:sneak#streak = 1
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

" gruvbox {{{
Plug 'morhetz/gruvbox'
set background=dark
let g:gruvbox_italic=1
" }}}

" lightline.vim {{{
Plug 'itchyny/lightline.vim'

let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'filename' ] ],
      \   'right': [ [ 'percent', 'lineinfo' ], [ 'filetype' ], [ 'fileformat', 'fileencoding' ] ]
      \ },
      \ 'component': {
      \   'lineinfo': ' %3l:%-2v'
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' },
      \ 'tabline_separator': { 'left': '', 'right': '' },
      \ 'tabline_subseparator': { 'left': '|', 'right': '|' },
      \ }

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

Plug 'tpope/vim-surround'

Plug 'tpope/vim-unimpaired'

Plug 'tpope/vim-rsi'

call plug#end()
" }}}

" ##Basics {{{

" Colorscheme
colorscheme gruvbox

" Disable some builtin plugins
let g:loaded_vimballPlugin = 1
let g:loaded_rrhelper = 1
let g:loaded_getscriptPlugin = 1
let g:did_install_default_menus = 1

let g:python_host_skip_check = 1
let g:python3_host_skip_check = 1
let g:python_host_prog='/usr/local/bin/python2.7'
let g:python3_host_prog='/usr/local/bin/python3'

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

" Sytem clipboard for yanking
set clipboard=unnamed

" Mode shown by statusline
set noshowmode

" Easy buffer switching
set hidden

" Default shell
set shell=$SHELL
set listchars=tab:\|\ ,eol:¬,trail:~,extends:❯,precedes:❮
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
set fillchars=vert:\ ,fold:·

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
set wildmode=longest:full,full
set wildignore+=.hg,.git,.svn,*.pyc,*.spl,*.o,*.out,*.DS_Store

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

  " Create tmp directories if not existing
  if !isdirectory(expand(&backupdir))
    call mkdir(expand(&backupdir), "p")
  endif

  if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
  endif

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
nnoremap <tab> :bnext<cr>
nnoremap <s-tab> :bprevious<cr>

" Paste mode
set pastetoggle=<F2>

" JS standard formatter
nnoremap <leader>ej :silent !standard-format % --write <cr>

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

" vim:foldmethod=marker:foldlevel=0
