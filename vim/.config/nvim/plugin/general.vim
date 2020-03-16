" Resize splits when the window is resized
autocmd VimResized * :wincmd =

set modelines=1
set autoread
set fileformats=unix,mac,dos
set fileformat=unix
set encoding=utf-8
set ttimeout
set ttimeoutlen=100
set backspace=indent,eol,start
set showcmd
set hlsearch incsearch
if exists('&inccommand')
  set inccommand=split
endif
set ignorecase smartcase
set lazyredraw

" Always show statusline
set laststatus=2

set signcolumn=yes

" Flash matching parenthesis
set showmatch
set matchtime=2

" Shorter messages
set shortmess=aIToOc

" Allow all mouse
set mouse=a

" Better splitting
set splitbelow
set splitright

" Diff Mode
set diffopt=filler,vertical

" Easy buffer switching
set hidden

set scrolloff=8
set sidescrolloff=10
set synmaxcol=500
set history=1000
set tabpagemax=50

" No bells
set visualbell t_vb=
set nojoinspaces

" Nicer vertical splits
let &fillchars='vert: ,fold:·'
let &listchars='tab:| ,eol:¬,trail:⣿,extends:→,precedes:←'

" Better Completion
set completeopt=noinsert,menuone,noselect
set pumheight=20

" Visual-block can free move
set virtualedit=block

" 2 spaces indentation, no tabs
set shiftwidth=2
set shiftround
set smarttab
set tabstop=2
set softtabstop=2
set expandtab
set breakindent
set autoindent
let &showbreak="↪ "

set selection=exclusive

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

" Dictionary
set dictionary=/usr/share/dict/words

" No need
set noswapfile

" Persistent undo and swap files directory
set undofile

set nobackup
set nowritebackup

" Change vim temporary directories
if !has('nvim')
  set undodir=~/.vim/tmp/undo//
  set backupdir=~/.vim/tmp/backup//

  set viminfo+=n~/.vim/viminfo
endif

" PHP
let g:PHP_noArrowMatching = 1
