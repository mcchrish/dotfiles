set nocompatible              " be iMproved, required

" ##Vim-Plug {{{
" Automatic installation of Vim-Plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.vim/bundle')
Plug 'tpope/vim-fugitive'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'marijnh/tern_for_vim', { 'do': 'npm install' }
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'junegunn/fzf.vim'
Plug 'simnalamburt/vim-mundo'
Plug 'scrooloose/nerdtree', { 'on':  ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'tomtom/tcomment_vim'
Plug 'Raimondi/delimitMate'
Plug 'scrooloose/syntastic'
Plug 'altercation/vim-colors-solarized'
Plug 'morhetz/gruvbox'
Plug 'bling/vim-airline'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'unblevable/quick-scope'
Plug 'othree/yajs.vim', { 'for': 'javascript' }
Plug 'othree/javascript-libraries-syntax.vim', { 'for': 'javascript' }
Plug 'othree/html5.vim', { 'for': 'html' }
Plug 'slava/vim-spacebars', { 'for': 'html' }
Plug 'mustache/vim-mustache-handlebars', { 'for': ['html', 'mustasche', 'handlebar'] }
Plug 'groenewege/vim-less', { 'for': 'less' }
Plug 'mattn/emmet-vim'
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
Plug 'junegunn/limelight.vim', { 'on': 'Limelight' }
Plug 'reedes/vim-pencil', { 'for': ['fountain', 'markdown', 'text'] }
Plug 'mcchrish/fountain.vim', { 'for': 'fountain' }

call plug#end()
" }}}

" ##Basics {{{
set modelines=1
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
set showmatch
set autoindent
set showbreak=…\
set clipboard=unnamed " system clipboard for yanking
set ttyfast " faster terminal redraw
set noshowmode " airline shows the mode
set hidden
set shell=$SHELL " whatever is default. most probably zsh

set scrolloff=2
set sidescrolloff=5
set history=1000
set tabpagemax=50

" Better Completion
"set complete=.,w,b,u,t
"set completeopt=longest,menuone,preview

" Resize splits when the window is resized
au VimResized * :wincmd =

" space as tab indentation
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab

" wrapping
set wrap
set linebreak
set textwidth=80
set formatoptions=cq " format using textwidth, including comments and gq

set wildignore+=.hg,.git,.svn,*.pyc,*.spl,*.o,*.out,*.DS_Store,*.class,*.manifest,*~,#*#,%*
set wildignore+=*.jpg,*.jpeg,*.png,*.gif,*.zip,*.xc*,*.pbxproj,*.xcodeproj/**,*.xcassets/**
" }}}

" ##Functions {{{

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

function! SearchWordWithAg()
  execute 'FzfAg' expand('<cword>')
endfunction

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


" "}}}

"  ##GUI {{{
if has('gui_running')
	set background=light
else
	set background=dark
endif

if has('gui_running')
	set guifont=Source\ Code\ Pro:h10
	set guioptions-=r
  set guioptions-=l
  set guioptions-=L
  set guioptions-=R
  set lines=45
  set columns=120
endif

" colorscheme solarized
let g:gruvbox_italic=1
colorscheme gruvbox

" }}}

" ##NEOVIM {{{
if has('nvim')
  " let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
  " workaround for the current nevom + tmux bug
  nmap <silent> <bs> :<c-u>TmuxNavigateLeft<cr>
endif

" }}}

"  ##Plugin-Options {{{

" YouCompleteMe
let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']

let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_filepath_completion_use_working_dir = 1

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
	autocmd FileType fountain       call pencil#init()
	autocmd FileType mardown, mkd   call pencil#init()
	autocmd FileType text           call pencil#init()
augroup END

" Javascript autocomplete
" autocmd FileType javascript setlocal omnifunc=tern#Complete
let g:used_javascript_libs = 'jquery,underscore,requirejs,handlebars'

" Handlebars
let g:mustache_abbreviations = 1

" Enable matchit.vim
runtime macros/matchit.vim

" Emmet
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
let g:user_emmet_leader_key='<C-A>'

" For YCM
let g:ycm_path_to_python_interpreter = '/usr/bin/python'

" Syntastic Recommended setting
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_html_checkers=['eslint']
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'

" vim-airline configure
let g:airline_powerline_fonts = 1
" let g:airline#extensions#tabline#enabled = 1

" fzf
let g:fzf_command_prefix = 'Fzf'
let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit' }

" NERDTree
let NERDTreeDirArrows = 1

" delimitMate
let delimitMate_expand_cr = 1

" }}}

"  ##Keymapping {{{

" Remap Leader
let mapleader = "\<space>"
let maplocalleader = "\\"

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" more scroll
nnoremap <C-Y> 4<C-Y>
nnoremap <C-E> 4<C-E>

" reselect indent in visual mode
vnoremap < <gv
vnoremap > >gv

" Remap esc
inoremap jk <esc>

" Other Remaps
nnoremap Q <nop>
nnoremap Y y$

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
set pastetoggle=<F2>

" Goyo toggle
nnoremap <silent> <Leader>- :Goyo<CR>

" NERDTree toggle
nnoremap <silent> <leader>= :NERDTreeToggle<CR>

" Gundo
nnoremap <leader>u :GundoToggle<CR>

" fzf
nnoremap <silent> <leader>f :FzfFiles<CR>
nnoremap <silent> <leader>a :FzfAg<CR>
nnoremap <silent> <leader>b :FzfBuffers<CR>
nnoremap <silent> K :call SearchWordWithAg()<CR>
vnoremap <silent> K :call SearchVisualSelectionWithAg()<CR>

imap <C-x><C-f> <plug>(fzf-complete-file-ag)
imap <C-x><C-l> <plug>(fzf-complete-line)

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
cnoremap <M-f> <S-Right>

" Fugitive
nnoremap <silent> <leader>gs :Gstatus<CR>

" remove whitespaces
nnoremap <silent> <F4> :call <SID>StripTrailingWhitespaces()<CR>

" }}}

" ##Autocmd {{{
augroup configgroup
  autocmd!
  autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md,*.rb :call <SID>StripTrailingWhitespaces()
augroup END
" }}}

" vim:foldmethod=marker:foldlevel=0
