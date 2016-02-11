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
set noshowmode
" Easy buffer switching
set hidden
" Default shell
set shell=$SHELL
set listchars=tab:\|\ ,eol:¬,trail:⌴,extends:❯,precedes:❮
set scrolloff=4
set sidescrolloff=5
set synmaxcol=200
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

" JS standard formatter
nnoremap <leader>ej :silent !standard-format % --write <cr>

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
Plug 'SirVer/ultisnips' | Plug 'mcchrish/vim-snippets'

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

" vim-gtfo {{{
Plug 'justinmk/vim-gtfo'
let g:gtfo#terminals = { 'mac' : 'iterm' }
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

" vim-easy-align {{{
Plug 'junegunn/vim-easy-align'
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" }}}

Plug 'Konfekt/FastFold'

Plug 'romainl/vim-qf'

" quick-scope {{{
Plug 'unblevable/quick-scope'
let g:qs_first_occurrence_highlight_color = '#fabd2f'
let g:qs_second_occurrence_highlight_color = '#d65d0e'

let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

nmap <leader>q <plug>(QuickScopeToggle)
vmap <leader>q <plug>(QuickScopeToggle)
" }}}

Plug 'wellle/targets.vim'

" vim-sneak {{{
Plug 'justinmk/vim-sneak'
let g:sneak#streak = 1
" }}}

" undotree {{{
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
let g:undotree_WindowLayout = 2
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_SplitWidth = 40
nnoremap <silent> <leader>u :UndotreeToggle<cr>
" }}}

" vim-signature {{{
Plug 'kshenoy/vim-signature'
nnoremap <silent> <leader>' :SignatureToggleSigns<cr>
" }}}

" neomake {{{
Plug 'benekastah/neomake'

let g:neomake_javascript_enabled_makers = ['standard']
let g:neomake_jsx_enabled_makers = ['standard']
let g:neomake_python_enabled_makers = ['flake8']
let g:neomake_less_enabled_makers = []
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

" Alduin {{{
Plug 'AlessandroYorba/Alduin'
let g:alduin_Shout_Windhelm = 1
"}}}

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

let s:except_ft = 'help\|undotree\|fzf\|vim-plug'
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
" Plug 'airblade/vim-gitgutter'
Plug 'airblade/vim-gitgutter', { 'on': 'GitGutterToggle' }
let g:gitgutter_max_signs = 200
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0
let g:gitgutter_grep_command = 'ag --nocolor'

nnoremap <silent> <F3> :GitGutterToggle<cr>
"}}}

Plug 'tpope/vim-surround'

Plug 'rstacruz/vim-closer'

Plug 'tpope/vim-unimpaired'

Plug 'tpope/vim-repeat'

Plug 'tpope/vim-eunuch'

Plug 'tpope/vim-endwise'

Plug 'othree/yajs.vim', { 'for': ['javascript', 'javascript.jsx', 'jsx', 'html'] }

Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx', 'jsx'] }

Plug 'othree/html5.vim', { 'for': 'html' }

" javascript-libraries-syntax.vim {{{
Plug 'othree/javascript-libraries-syntax.vim', { 'for': ['javascript', 'javascript.jsx', 'jsx', 'html'] }
let g:used_javascript_libs = 'jquery,underscore,react,handlebars'
" }}}

Plug 'gavocanov/vim-js-indent', { 'for': ['javascript', 'javascript.jsx', 'jsx'] }

" tern_for_vim {{{
Plug 'marijnh/tern_for_vim', { 'do': 'npm install && npm update', 'for': ['javascript', 'javascript.jsx' , 'jsx'] }
nnoremap <silent> <leader>td :TernDef<cr>
nnoremap <silent> <leader>ts :TernDefSplit<cr>
" }}}

" vim-mustasche-handlebars {{{
Plug 'mustache/vim-mustache-handlebars', { 'for': ['html', 'mustasche', 'handlebar'] }
let g:mustache_abbreviations = 1
" }}}

Plug 'othree/csscomplete.vim', { 'for': [ 'sass', 'css', 'less' ] }

Plug 'rstacruz/vim-hyperstyle', { 'for': [ 'sass', 'css', 'less' ] }

Plug 'groenewege/vim-less', { 'for': 'less' }

" python-syntax {{{
Plug 'hdima/python-syntax', { 'for': 'python' }
let python_highlight_all = 1
" }}}

" emmet-vim {{{
Plug 'mattn/emmet-vim'

let g:user_emmet_install_global = 1
let g:user_emmet_leader_key='<C-A>'
let g:user_emmet_settings = { 'javascript': { 'quote_char': "'" } }
" }}}

" goyo.vim {{{
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
nnoremap <silent> <leader>- :Goyo<cr>
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

Plug 'rizzatti/dash.vim', { 'on': 'Dash' }

call plug#end()
" }}}

" ##On Plugin loaded {{{

" gruvbox
colorscheme gruvbox
" colorscheme alduin

" vim-signature
let g:SignatureEnabledAtStartup=0

" Neomake
" Check syntax on file open and write
autocmd! BufWritePost * Neomake
autocmd! BufRead * Neomake
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

augroup pencil
  autocmd!
  autocmd FileType fountain    call pencil#init()
  autocmd FileType fountain    setlocal showbreak=
  autocmd FileType mardown,mkd call pencil#init()
  autocmd FileType text        call pencil#init()
augroup end

augroup ft_html
  autocmd!
  autocmd FileType html                          setlocal foldmethod=indent
  autocmd FileType html                          setlocal nofoldenable
  autocmd FileType html,css,htmldjango,scss,less EmmetInstall
augroup end

augroup ft_javascript
  autocmd FileType javascript setlocal shiftwidth=2
  autocmd FileType javascript setlocal tabstop=2
  autocmd FileType javascript setlocal softtabstop=2
  autocmd FileType javascript setlocal expandtab
augroup end


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
augroup end

augroup general
  autocmd!
  autocmd BufWritePre *.php,*.py,*.js,*.jsx,*.txt,*.hs,*.java,*.md,*.rb :call <sid>StripTrailingWhitespaces()
  autocmd FileType less,scss,sass,css setlocal omnifunc=csscomplete#CompleteCSS noci
  autocmd FileType html,markdown      setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript         setlocal omnifunc=tern#Complete
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
