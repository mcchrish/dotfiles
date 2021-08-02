" Easy buffer switching
set hidden

" Resize splits when the window is resized
autocmd VimResized * :wincmd =

" :h lua-highlight
autocmd TextYankPost * silent! lua vim.highlight.on_yank()

set modelines=1
set fileformats=unix,mac,dos
set fileformat=unix
set timeoutlen=700
if exists('&inccommand')
  set inccommand=split
endif
set ignorecase smartcase
set lazyredraw

set number
set signcolumn=number

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

set scrolloff=8
set sidescrolloff=10
set synmaxcol=500
set history=1000
set tabpagemax=50

set nojoinspaces

" Nicer vertical splits
let &fillchars='vert: ,fold:·'
let &listchars='tab:| ,eol:¬,trail:⣿,extends:→,precedes:←'

" Better completion
set pumheight=20

" Visual-block can free move
set virtualedit=block

" 4 spaces indentation, no tabs
set shiftwidth=4
set shiftround
set tabstop=4
set softtabstop=4
set expandtab
set breakindent
let &showbreak="↪ "

set selection=exclusive

" Wrapping
set linebreak
set textwidth=80
set formatoptions=cqj1 " format using textwidth, including comments and gq

" Stay on the same column if possible
set nostartofline

" Menu complete
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

let g:PHP_noArrowMatching = 1
