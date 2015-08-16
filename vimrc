set nocompatible              " be iMproved, required

" Automatic installation of Vim-Plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.vim/bundle')
Plug 'tpope/vim-fugitive'
Plug 'Valloric/YouCompleteMe', { 'do': './install.sh' }
Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'marijnh/tern_for_vim', { 'do': 'npm install' }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'scrooloose/nerdtree', { 'on':  ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/syntastic'
Plug 'altercation/vim-colors-solarized'
Plug 'bling/vim-airline'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'unblevable/quick-scope'
Plug 'othree/yajs.vim', { 'for': 'javascript' }
Plug 'othree/javascript-libraries-syntax.vim', { 'for': 'javascript' }
Plug 'mustache/vim-mustache-handlebars', { 'for': ['html', 'mustasche', 'handlebar'] }
Plug 'othree/html5.vim', { 'for': 'html' }
Plug 'mattn/emmet-vim', { 'for': 'html' }
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
Plug 'junegunn/limelight.vim', { 'on': 'Limelight' }
Plug 'reedes/vim-pencil', { 'for': ['fountain', 'markdown'] }
Plug 'mcchrish/fountain.vim', { 'for': 'fountain' }
Plug 'rking/ag.vim'

" currently not necessary
"Plug 'airblade/vim-gitgutter'
"Plug 'pangloss/vim-javascript'
"Plug 'jelera/vim-javascript-syntax'
call plug#end()

" ==== ~Basics ====
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
set clipboard=unnamed " system clipboard for yanking
set ttyfast " faster terminal redraw
set noshowmode " airline shows the mode

set shell=$SHELL " whatever is default. most probably zsh

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

" ==== ~Functions ====

" Remove whitespaces
function! <SID>StripTrailingWhitespaces()
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  %s/\s\+$//e
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

" ag + ctrlp
if exists("g:ctrlp_user_command")
  unlet g:ctrlp_user_command
endif
if executable('ag')
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command =
    \ 'ag %s --files-with-matches -g "" --ignore "\.git$\|\.hg$\|\.svn$"'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
else
  " Fall back to using git ls-files if Ag is not available
  let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others']
endif


" ==== ~GUI ====
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

" ==== ~Plugin-Options ====

" YouCompleteMe
let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']

let g:ycm_autoclose_preview_window_after_completion = 1

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
let g:syntastic_html_checkers=['jshint']
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'

" vim-airline configure
let g:airline_powerline_fonts = 1

" ctrlp
let g:ctrlp_working_path_mode = 'r'

" NERDTree
let NERDTreeDirArrows = 1

" ==== ~Keymapping ====

" Remap Leader
let mapleader = "\<space>"
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
"nnoremap <CR><CR> <CR>
"nnoremap <CR> :
"nnoremap <buffer> <cr> ==
"xnoremap <buffer> <cr> =
"nunmap <buffer> <CR>

" Remap <space>
"noremap <space> :

" Other Remaps
nnoremap Q <nop>
nnoremap Y y$
nmap <Leader>fu :set fullscreen<CR>
" faster save
nnoremap <Leader>w :w<CR>

" System clipboards
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" no need command line
map q: :q

" Faster Goyo toggle
nnoremap <Leader>gt :Goyo<CR>

" NERDTree toggle
nnoremap <leader>nt :NERDTreeToggle<CR>

" Ag
nmap <leader>ag :Ag ""<Left>
nmap <leader>af :AgFile ""<Left>

" ctrlP
let g:ctrlp_map = '<leader>o'
nnoremap <leader>b :CtrlPBuffer<CR>

" Map the leader key + q to toggle quick-scope's highlighting in normal/visual mode.
" Note that you must use nmap/vmap instead of their non-recursive versions (nnoremap/vnoremap).
" Quickscope only when need
" from https://gist.github.com/cszentkiralyi/dc61ee28ab81d23a67aa
nmap <leader>q <plug>(QuickScopeToggle)
vmap <leader>q <plug>(QuickScopeToggle)

" allow command line editing like emacs
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <M-b> <S-Left>
"cnoremap ˘ <S-Left>
cnoremap <M-f> <S-Right>
"cnoremap ƒ <S-Right>

" remove whitespaces
nnoremap <silent> <Leader>tr :call <SID>StripTrailingWhitespaces()<CR>

" Auto reload vimrc
"augroup reload_vimrc " {
	"autocmd!
	"autocmd BufWritePost $MYVIMRC source $MYVIMRC
"augroup END " }
