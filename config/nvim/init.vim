" ##Vim-Plug {{{
" Automatic installation of Vim-Plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'Shougo/deoplete.nvim'
Plug 'davidhalter/jedi-vim', { 'for': 'python' }
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'christoomey/vim-tmux-navigator'
Plug 'justinmk/vim-dirvish'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'junegunn/fzf.vim'
Plug 'justinmk/vim-sneak'
Plug 'simnalamburt/vim-mundo'
Plug 'benekastah/neomake'
Plug 'tomtom/tcomment_vim'
Plug 'Raimondi/delimitMate'
Plug 'altercation/vim-colors-solarized'
Plug 'morhetz/gruvbox'
Plug 'bling/vim-airline'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-eunuch'
Plug 'unblevable/quick-scope'
Plug 'othree/yajs.vim', { 'for': 'javascript' }
Plug 'othree/javascript-libraries-syntax.vim', { 'for': 'javascript' }
Plug 'gavocanov/vim-js-indent', { 'for': 'javascript' }
Plug 'marijnh/tern_for_vim', { 'do': 'npm install', 'for': 'javascript' }
Plug 'othree/html5.vim', { 'for': 'html' }
Plug 'slava/vim-spacebars', { 'for': 'html' }
Plug 'mustache/vim-mustache-handlebars', { 'for': ['html', 'mustasche', 'handlebar'] }
Plug 'groenewege/vim-less', { 'for': 'less' }
Plug 'hdima/python-syntax', { 'for': 'python' }
Plug 'mattn/emmet-vim'
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
Plug 'junegunn/limelight.vim', { 'on': 'Limelight' }
Plug 'reedes/vim-pencil', { 'for': ['fountain', 'markdown', 'text'] }
Plug 'mcchrish/fountain.vim', { 'for': 'fountain' }
Plug 'tpope/vim-capslock'

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
set noshowmode " airline shows the mode
set hidden
set shell=$SHELL " whatever is default. most probably zsh

set scrolloff=2
set sidescrolloff=5
set history=1000
set tabpagemax=50

" Better Completion
"set complete=.,w,b,u,t
set completeopt-=preview
set completeopt+=menuone

" Resize splits when the window is resized
autocmd VimResized * :wincmd =

" Indentation
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


" Neovim bug workaround
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
nmap <silent> <bs> :<c-u>TmuxNavigateLeft<cr>
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
  echo 'Whitespace trimmed!'
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

function! Refresh()
  checktime
  redraw
  nohlsearch
  echo 'Refreshed'
endfunction

function! SetAsDjangoProject()
  augroup ft_django
    autocmd BufNewFile,BufRead *.html,*.swig,*.twig setlocal filetype=htmldjango
    autocmd FileType html,htmldjango setlocal foldmethod=manual

    autocmd BufNewFile,BufRead admin.py        setlocal filetype=python.django
    autocmd BufNewFile,BufRead urls.py         setlocal filetype=python.django
    autocmd BufNewFile,BufRead models.py       setlocal filetype=python.django
    autocmd BufNewFile,BufRead views.py        setlocal filetype=python.django
    autocmd BufNewFile,BufRead settings.py     setlocal filetype=python.django
    autocmd BufNewFile,BufRead settings.py     setlocal foldmethod=marker
    autocmd BufNewFile,BufRead forms.py        setlocal filetype=python.django
  augroup END
endfunction

" "}}}

"  ##GUI {{{

" colorscheme solarized
set background=dark
let g:gruvbox_italic=1
colorscheme gruvbox

" }}}

"  ##Plugin-Options {{{

" Deoplete.nvim
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1

inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction

" Deoplete x Jedi
autocmd FileType python setlocal omnifunc=jedi#completions
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#smart_auto_mappings = 0
let g:jedi#show_call_signatures = 0

" Ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:python_host_prog='/usr/local/bin/python2.7'
let g:python3_host_prog='/usr/local/bin/python3.5'
let g:UltiSnipsUsePythonVersion = 3

" For fountain syntax
autocmd FileType fountain let g:goyo_width=60

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
let g:used_javascript_libs = 'jquery,underscore,requirejs,handlebars'

" Python
let python_highlight_all = 1

" Handlebars
let g:mustache_abbreviations = 1

" Emmet
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
let g:user_emmet_leader_key='<C-A>'

" neomake
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_python_enabled_makers = ['flake8']
let g:neomake_less_enabled_makers = ['lessc']
let g:neomake_shell_enabled_makers = ['shellcheck']
let g:neomake_html_enabled_makers = []
let g:neomake_open_list = 0
let g:neomake_verbose = 0
autocmd! BufWritePost * Neomake
autocmd! BufRead * Neomake

" sneak
let g:sneak#streak = 1

" vim-airline configure
let g:airline_powerline_fonts = 1
let g:airline_section_x = ''
let g:airline_section_y = airline#section#create(['tagbar', 'filetype'])
let g:airline_mode_map = {
      \ '__' : '-',
      \ 'n'  : 'N',
      \ 'i'  : 'I',
      \ 'R'  : 'R',
      \ 'c'  : 'C',
      \ 'v'  : 'V',
      \ 'V'  : 'V',
      \ '' : 'V',
      \ 's'  : 'S',
      \ 'S'  : 'S',
      \ '' : 'S',
      \ }

" fzf
let g:fzf_command_prefix = 'Fzf'
let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit' }

" Dirvish
let g:dirvish_hijack_netrw = 1
let g:dirvish_relative_paths = 1

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

" easy reindenting
nnoremap g= gg=Gg``

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

" Paste mode
set pastetoggle=<F2>

" Goyo toggle
nnoremap <silent> <Leader>- :Goyo<CR>

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
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gb :Gblame<CR>

" remove whitespaces
nnoremap <silent> <F4> :call <SID>StripTrailingWhitespaces()<CR>

" refresh
nnoremap <silent> <f5> :call Refresh()<CR>

" }}}

" ##Autocmd {{{

augroup ft_javascript
  autocmd FileType javascript setlocal shiftwidth=2
  autocmd FileType javascript setlocal tabstop=2
  autocmd FileType javascript setlocal softtabstop=2
  autocmd FileType javascript setlocal expandtab
augroup END


augroup ft_python
  au!
  autocmd FileType python setlocal shiftwidth=4
  autocmd FileType python setlocal shiftround
  autocmd FileType python setlocal tabstop=4
  autocmd FileType python setlocal softtabstop=4
  autocmd FileType python setlocal expandtab
  autocmd FileType python setlocal foldmethod=indent
  autocmd FileType python setlocal nofoldenable
augroup END

augroup general
  autocmd!
  autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md,*.rb :call <SID>StripTrailingWhitespaces()
  autocmd FileType less, scss, sass, css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=tern#Complete
augroup END
" }}}

" ##Local {{{

" Detect Django project
if filereadable(glob("manage.py")) 
  " autocmd FileType html set filetype=django syntax=django
  call SetAsDjangoProject()
endif

" }}}

" vim:foldmethod=marker:foldlevel=0
