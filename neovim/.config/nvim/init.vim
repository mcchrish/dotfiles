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
set showbreak=↪︎\ 
set clipboard=unnamed " system clipboard for yanking
set noshowmode " airline shows the mode
set hidden
set shell=$SHELL " whatever is default. most probably zsh
set listchars=tab:▸\ ,eol:¬,trail:⋅,space:\|,nbsp:␣,extends:❯,precedes:❮
set scrolloff=2
set sidescrolloff=5
set history=1000
set tabpagemax=50

" Better Completion
set completeopt-=preview
set completeopt+=menuone

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

set wildignore+=.hg,.git,.svn,*.pyc,*.spl,*.o,*.out,*.DS_Store,*.class,*.manifest,*~,#*#,%*
set wildignore+=*.jpg,*.jpeg,*.png,*.gif,*.zip,*.xc*,*.pbxproj,*.xcodeproj/**,*.xcassets/**


" Neovim bug workaround
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
nmap <silent> <bs> :<c-u>TmuxNavigateLeft<cr>

" Persistent undo and swap files directory
set undofile

" }}}

"  ##Keymapping {{{

" Remap Leader
let mapleader = "\<space>"
let maplocalleader = "\\"

" Enter command line mode
noremap <cr> :

" make Enter/CR work normally in quickfix and command-window
augroup enter_correctly
  autocmd!
  autocmd BufReadPost quickfix nnoremap <buffer> <cr> <cr>
  autocmd CmdWinEnter * nnoremap <buffer> <cr> <cr>
augroup END

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

" allow command line editing like emacs
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <M-b> <S-Left>
cnoremap <M-f> <S-Right>

" Remove search highlight
nnoremap <silent> <leader><CR> :nohlsearch<CR>

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
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
" }}}

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

" }}}

" deoplete.nvim x jedi.vim {{{
Plug 'davidhalter/jedi-vim', { 'for': 'python' }

let g:deoplete#omni_patterns.python = '[^. \t]\.\w*\|from .* import \w*'
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#smart_auto_mappings = 0
let g:jedi#show_call_signatures = 0
" }}}

" echodoc.vim {{{
Plug 'Shougo/echodoc.vim'
let g:echodoc_enable_at_startup = 1
" }}}

" ultisnips {{{
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:python_host_prog='/usr/local/bin/python2.7'
let g:python3_host_prog='/usr/local/bin/python3'
let g:UltiSnipsUsePythonVersion = 3
" }}}

Plug 'christoomey/vim-tmux-navigator'

" vim-dirvish {{{
Plug 'justinmk/vim-dirvish'
let g:dirvish_hijack_netrw = 1
let g:dirvish_relative_paths = 1
" }}}

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

nnoremap <silent> <leader>A :FzfAgAll<CR>

nnoremap <silent> <leader>f :FzfFiles<CR>
nnoremap <silent> <leader>a :FzfAg<CR>
nnoremap <silent> <leader>b :FzfBuffers<CR>
nnoremap <silent> K :call SearchWordWithAg()<CR>
vnoremap <silent> K :call SearchVisualSelectionWithAg()<CR>

imap <C-x><C-f> <plug>(fzf-complete-file-ag)
imap <C-x><C-l> <plug>(fzf-complete-line)

" }}}

" vim-easy-align {{{
Plug 'junegunn/vim-easy-align'
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" }}}

" vim-sneak {{{
Plug 'justinmk/vim-sneak'
let g:sneak#streak = 1
" }}}

" undotree {{{
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
let g:undotree_WindowLayout = 2
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_SplitWidth = 40
nnoremap <leader>u :UndotreeToggle<CR>
" }}}

" neomake {{{
Plug 'benekastah/neomake'

let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_python_enabled_makers = ['flake8']
let g:neomake_less_enabled_makers = ['lessc']
let g:neomake_shell_enabled_makers = ['shellcheck']
let g:neomake_html_enabled_makers = []
let g:neomake_open_list = 0
let g:neomake_verbose = 0

let g:neomake_error_sign = {
      \ 'text': '✖',
      \ 'texthl': 'SyntasticErrorSign',
      \ }

let g:neomake_warning_sign = {
      \ 'text': '⚠',
      \ 'texthl': 'SyntasticWarningSign',
      \ }
" }}}

Plug 'tomtom/tcomment_vim'

" gruvbox {{{
Plug 'morhetz/gruvbox'
set background=dark
let g:gruvbox_italic=1
" }}}

" vim-airline {{{
Plug 'bling/vim-airline'

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" No powerline for latest Fira Mono
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_left_alt_sep = '|'
let g:airline_right_alt_sep = '|'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_symbols.readonly = 'ṟ'
let g:airline_symbols.crypt = 'ṟ'

let g:airline_section_x = ''

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

" Shorter error status line
let g:airline#extensions#whitespace#trailing_format = '|| :%s'
let g:airline#extensions#whitespace#mixed_indent_format = '>> :%s'
let g:airline#extensions#whitespace#checks = [ 'indent', 'trailing' ]

" Include fountain word count
let g:airline#extensions#wordcount#filetypes = '\vmarkdown|rst|org|fountain'
let g:airline#extensions#wordcount#format = '%d w'

" }}}

Plug 'tpope/vim-surround'

Plug 'tpope/vim-unimpaired'

Plug 'tpope/vim-repeat'

Plug 'tpope/vim-eunuch'

Plug 'othree/yajs.vim', { 'for': ['javascript', 'html'] }

Plug 'othree/html5.vim', { 'for': 'html' }

" javascript-libraries-syntax.vim {{{
Plug 'othree/javascript-libraries-syntax.vim', { 'for': 'javascript' }
let g:used_javascript_libs = 'jquery,underscore,requirejs,handlebars'
" }}}

" vim-esformatter {{{
Plug 'millermedeiros/vim-esformatter', { 'for': 'javascript' }
nnoremap <silent> <leader>es :Esformatter<CR>
vnoremap <silent> <leader>es :EsformatterVisual<CR>
" }}}

Plug 'gavocanov/vim-js-indent', { 'for': 'javascript' }

Plug 'marijnh/tern_for_vim', { 'do': 'npm install', 'for': 'javascript' }

" vim-mustasche-handlebars {{{
Plug 'mustache/vim-mustache-handlebars', { 'for': ['html', 'mustasche', 'handlebar'] }
let g:mustache_abbreviations = 1
" }}}

Plug 'groenewege/vim-less', { 'for': 'less' }

" python-syntax {{{
Plug 'hdima/python-syntax', { 'for': 'python' }
let python_highlight_all = 1
" }}}

" emmet-vim {{{
Plug 'mattn/emmet-vim'

let g:user_emmet_install_global = 0
let g:user_emmet_leader_key='<C-A>'
" }}}

" goyo.vim {{{
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
nnoremap <silent> <Leader>- :Goyo<CR>
" }}}

" limelight.vim {{{
Plug 'junegunn/limelight.vim', { 'on': 'Limelight' }

let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
" }}}

" incsearch.vim {{{
" Not working properly in neovim
" Plug 'haya14busa/incsearch.vim'

" map /  <Plug>(incsearch-forward)
" map ?  <Plug>(incsearch-backward)
" map g/ <Plug>(incsearch-stay)

" " auto noh
" let g:incsearch#auto_nohlsearch = 1
" map n  <Plug>(incsearch-nohl-n)
" map N  <Plug>(incsearch-nohl-N)
" map *  <Plug>(incsearch-nohl-*)
" map #  <Plug>(incsearch-nohl-#)
" map g* <Plug>(incsearch-nohl-g*)
" map g# <Plug>(incsearch-nohl-g#)

" let g:incsearch#separate_highlight = 1

" }}}

" vim-pencil {{{
Plug 'reedes/vim-pencil', { 'for': ['fountain', 'markdown', 'text'] }
let g:pencil#wrapModeDefault = 'soft'
" }}}

Plug 'mcchrish/fountain.vim', { 'for': 'fountain' }

call plug#end()
" }}}

" ##On Plugin loaded {{{

" gruvbox
colorscheme gruvbox

" airline
let g:airline_section_y = airline#section#create(['tagbar', 'filetype'])

" Neomake
" Check syntax on file open and write
autocmd! BufWritePost * Neomake
autocmd! BufRead * Neomake
" }}}

" ##Functions {{{

" Remove whitespaces {{{
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

nnoremap <silent> <F4> :call <SID>StripTrailingWhitespaces()<CR>
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
  AirlineRefresh
  echo 'Refreshed!'
endfunction

nnoremap <silent> <f5> :call Refresh()<CR>
" }}}

" SetAsDjangoProject {{{
function! SetAsDjangoProject()
  augroup ft_django
    autocmd BufNewFile,BufRead *.html setlocal filetype=htmldjango
    autocmd FileType html,htmldjango setlocal foldmethod=indent
    autocmd FileType html,htmldjango setlocal nofoldenable
    autocmd BufNewFile,BufRead *.py setlocal filetype=python.django
  augroup END
endfunction
" }}}

" SetAsMeteorProject {{{
function! SetAsMeteorProject()
  augroup meteor
    au!
    autocmd BufNewFile,BufRead *.html setlocal filetype=html.mustache
  augroup END
endfunction
" }}}

" }}}

" ##Autocmd {{{

augroup pencil
  autocmd!
  autocmd FileType fountain       call pencil#init()
  autocmd FileType mardown,mkd    call pencil#init()
  autocmd FileType text           call pencil#init()
augroup END

augroup ft_html
  autocmd!
  autocmd FileType html setlocal foldmethod=indent
  autocmd FileType html setlocal nofoldenable
  autocmd FileType html,css,htmldjango,scss,less EmmetInstall
augroup END

augroup ft_javascript
  autocmd FileType javascript setlocal shiftwidth=2
  autocmd FileType javascript setlocal tabstop=2
  autocmd FileType javascript setlocal softtabstop=2
  autocmd FileType javascript setlocal expandtab
augroup END


augroup ft_python
  autocmd!
  autocmd FileType python setlocal shiftwidth=4
  autocmd FileType python setlocal shiftround
  autocmd FileType python setlocal tabstop=4
  autocmd FileType python setlocal softtabstop=4
  autocmd FileType python setlocal expandtab
  autocmd FileType python setlocal foldmethod=indent
  autocmd FileType python setlocal nofoldenable
  autocmd FileType python setlocal omnifunc=jedi#completions
augroup END

augroup general
  autocmd!
  autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md,*.rb :call <SID>StripTrailingWhitespaces()
  autocmd FileType less,scss,sass,css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=tern#Complete
augroup END
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
