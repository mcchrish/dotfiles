" ##Basics {{{
set modelines=1
set autoread
set fileformats=unix,mac,dos
set fileformat=unix
set encoding=utf-8
set ttimeout
set ttimeoutlen=100
set backspace=indent,eol,start
set smarttab
set ruler
set showcmd
set number
set hlsearch incsearch
set ignorecase smartcase
set lazyredraw
set splitbelow
set splitright
set laststatus=2
set breakindent
set showmatch
set autoindent
set showbreak=↪︎\ 
" Sytem clipboard for yanking
set clipboard=unnamed
" Default shell
set shell=$SHELL
set listchars=tab:\|\ ,eol:¬,trail:⌴,extends:❯,precedes:❮
set scrolloff=4
set sidescrolloff=5
set synmaxcol=200
set history=1000
set tabpagemax=50

" Resize splits when the window is resized
autocmd VimResized * :wincmd =

" Indentation, 2 spaces no tabs
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab

" Wrapping
set wrap
set linebreak
set textwidth=80
set formatoptions=cq " format using textwidth, including comments and gq

" Menu complete
set wildmenu
set wildmode=longest:full,full
set wildignore+=.hg,.git,.svn,*.pyc,*.spl,*.o,*.out,*.DS_Store

" True color
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Neovim bug workaround
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
nmap <silent> <bs> :<c-u>TmuxNavigateLeft<cr>

" Persistent undo and swap files directory
set undofile

" }}}

"  ##Keymapping {{{

" Remap leader
let mapleader = "\<space>"
let maplocalleader = "\\"

" Enter command line mode
noremap <cr> :

" make Enter/cr work normally in quickfix and command-window
augroup enter_correctly
  autocmd!
  autocmd BufReadPost quickfix nnoremap <buffer> <cr> <cr>
  autocmd CmdWinEnter * nnoremap <buffer> <cr> <cr>
augroup end

" move vertically by visual line
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

" more scroll
nnoremap <C-Y> 4<C-Y>
nnoremap <C-E> 4<C-E>

" reselect indent in visual mode
vnoremap < <gv
vnoremap > >gv

" easy reindenting
nnoremap g= gg=Gg``

" saner regex
nnoremap / /\v
vnoremap / /\v

" Remap esc
inoremap jk <esc>

" Other Remaps
nnoremap Q <nop>
nnoremap Y y$

" Toggle relativenumber
nnoremap <leader>N :set relativenumber!<cr>

" faster save
nnoremap <leader>w :w<cr>

" Paste mode
set pastetoggle=<F2>

" allow command line editing like emacs
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <M-b> <S-Left>
cnoremap <M-f> <S-Right>

" }}}

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

" gv.vim {{{
Plug 'junegunn/gv.vim', { 'on': 'GV' }
" }}}

Plug 'nhooyr/neoman.vim'

Plug 'christoomey/vim-tmux-navigator'

Plug 'Konfekt/FastFold'

" quick-scope {{{
Plug 'unblevable/quick-scope'
let g:qs_first_occurrence_highlight_color = '#fabd2f'
let g:qs_second_occurrence_highlight_color = '#d65d0e'

let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

nmap <leader>q <plug>(QuickScopeToggle)
vmap <leader>q <plug>(QuickScopeToggle)
" }}}

" vim-sneak {{{
Plug 'justinmk/vim-sneak'
let g:sneak#streak = 1
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

call plug#end()
" }}}

" ##On Plugin loaded {{{

" gruvbox
colorscheme gruvbox

" }}}

" vim:foldmethod=marker:foldlevel=0
