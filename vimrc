set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'Valloric/YouCompleteMe'
Plugin 'ervandew/supertab'
Plugin 'SirVer/ultisnips'
Plugin 'marijnh/tern_for_vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
"Plugin 'jelera/vim-javascript-syntax'
Plugin 'othree/yajs.vim'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'othree/html5.vim'
Plugin 'mattn/emmet-vim'
Plugin 'honza/vim-snippets'
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'
Plugin 'reedes/vim-pencil'
Plugin 'mcchrish/fountain.vim'
Plugin 'rking/ag.vim'
"Plugin 'airblade/vim-gitgutter'
"Plugin 'pangloss/vim-javascript'

call vundle#end()            " required
filetype plugin indent on    " required

syntax enable

" Basics
set autoread
set fileformats+=mac
set ttimeout
set ttimeoutlen=100
set backspace=indent,eol,start
set smarttab
set ruler
set showcmd
set wildmenu
set wildmode=longest:full,full
set relativenumber
set number
set hlsearch incsearch
set ignorecase smartcase
set lazyredraw
set splitbelow
set splitright
set laststatus=2
set breakindent
set showbreak=…\ 

" Better Completion
"set complete=.,w,b,u,t
"set completeopt=longest,menuone,preview

" Resize splits when the window is resized
au VimResized * :wincmd =

" Hard tab indentation
set shiftwidth=2
set tabstop=2
set autoindent
set linebreak
set expandtab

if !&scrolloff
  set scrolloff=1
endif
if !&sidescrolloff
  set sidescrolloff=5
endif
set display+=lastline

if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

if has('path_extra')
  setglobal tags-=./tags tags-=./tags; tags^=./tags;
endif

if &history < 1000
  set history=1000
endif
if &tabpagemax < 50
  set tabpagemax=50
endif

set wildignore+=.hg,.git,.svn,*.pyc,*.spl,*.o,*.out,*.DS_Store,*.class,*.manifest,*~,#*#,%*
set wildignore+=*.jpg,*.jpeg,*.png,*.gif,*.zip,*.xc*,*.pbxproj,*.xcodeproj/**,*.xcassets/**

" Keymapping

" Remap Leader
let mapleader = ","
let maplocalleader = "\\"

" Better tab nav
map gr gT

" Switch windows with ctrl + hjkl
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Remap esc
inoremap jk <esc>

" Remap Enter
"nnoremap <CR> :

" Remap <space>
noremap <space> :

" Other Remaps
nnoremap Y y$

" NERDTree toggle
nnoremap <F4> :NERDTreeToggle<CR>

" allow command line editing like emacs
cnoremap <C-A>      <Home>
cnoremap <C-B>      <Left>
cnoremap <C-E>      <End>
cnoremap <C-F>      <Right>
cnoremap <C-N>      <End>
cnoremap <C-P>      <Up>
cnoremap <ESC>b     <S-Left>
cnoremap <ESC><C-B> <S-Left>
cnoremap <ESC>f     <S-Right>
cnoremap <ESC><C-F> <S-Right>
cnoremap <ESC><C-H> <C-W>

" GUI
" Solarized Theme
if has('gui_running')
	set background=light
else 
	set background=dark
endif

if has('gui_running')
	set guifont=Source\ Code\ Pro:h12
	set guioptions-=r
  set guioptions-=l
  set guioptions-=L
  set guioptions-=R
  set lines=999
  set columns=9999
endif

colorscheme solarized

" YouCompleteMe
let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']

" Supertab
let g:SuperTabDefaultCompletionType    = '<C-n>'
let g:SuperTabCrMapping                = 0

" Ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" For fountain syntax
au FileType fountain let g:goyo_width=60

" Goyo
function! s:goyo_enter()
	if has('gui_running')
		"set guioptions-=r
	endif
endfunction

function! s:goyo_leave()
	if has('gui_running')
		"set guioptions+=r
	endif
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" Limelight
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" vim-pencil
let g:pencil#wrapModeDefault = 'soft'

augroup pencil
	autocmd!
	autocmd FileType fountain call pencil#init()
augroup END

" Javascript autocomplete
" autocmd FileType javascript setlocal omnifunc=tern#Complete
let g:used_javascript_libs = 'jquery,underscore,requirejs,handlebars'

" Handlebars
let g:mustache_abbreviations = 1

" Enable matchit.vim
runtime macros/matchit.vim

" For YCM
let g:ycm_path_to_python_interpreter = '/usr/bin/python'

" Syntastic Recommended setting
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['jshint']

" vim-airline configure
let g:airline_powerline_fonts = 1

" ctrlp
let g:ctrlp_working_path_mode = 'r'

" Auto reload vimrc
augroup reload_vimrc " {
	autocmd!
	autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }
