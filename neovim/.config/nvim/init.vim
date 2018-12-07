" Leader
let mapleader = "\<space>"

" disable some builtin plugins
let g:did_install_default_menus = 1
let g:loaded_2html_plugin       = 1
let g:loaded_getscript          = 1
let g:loaded_getscriptplugin    = 1
let g:loaded_gzip               = 1
let g:loaded_logipat            = 1
let g:loaded_netrw              = 1
let g:loaded_netrwfilehandlers  = 1
let g:loaded_netrwplugin        = 1
let g:loaded_netrwsettings      = 1
let g:loaded_rrhelper           = 1
let g:loaded_tar                = 1
let g:loaded_tarplugin          = 1
let g:loaded_tutor_mode_plugin  = 1
let g:loaded_vimball            = 1
let g:loaded_vimballplugin      = 1
let g:loaded_zip                = 1
let g:loaded_zipplugin          = 1

let g:python_host_skip_check  = 1
let g:python3_host_skip_check = 1
let g:python_host_prog        = '/usr/local/bin/python2'
let g:python3_host_prog       = '/usr/local/bin/python3'

" ##Plugins {{{

call plug#begin('~/.config/nvim/plugged')

if has('nvim')

Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'

autocmd BufEnter * call ncm2#enable_for_buffer()

Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-tmux'
Plug 'ncm2/ncm2-path'

" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh'
    \ }

      " \ 'javascript': ['javascript-typescript-stdio'],
      " \ 'javascript.jsx': ['javascript-typescript-stdio']
      " \ 'javascript': ['flow', 'lsp'],
      " \ 'javascript.jsx': ['flow', 'lsp']
let g:LanguageClient_serverCommands = {
      \ 'javascript': ['flow-language-server', '--stdio'],
      \ 'javascript.jsx': ['flow-language-server', '--stdio']
      \ }

nnoremap <silent> <leader>c :call LanguageClient_contextMenu()<CR>

endif

if !has('gui_running')

" fzf {{{
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

let g:fzf_command_prefix = 'Fzf'
let g:fzf_buffers_jump = 1
let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit'
      \ }

command! -bang -nargs=* FzfRgAll
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --color=always --smart-case --hidden '.shellescape(<q-args>), 1,
      \   <bang>0)

" Search current word under cursor
function! SearchWordWithRg()
  execute 'FzfRg' expand('<cword>')
endfunction

" Search visual selected
function! SearchVisualSelectionWithRg() range
  let old_reg = getreg('"')
  let old_regtype = getregtype('"')
  let old_clipboard = &clipboard
  set clipboard&
  normal! ""gvy
  let selection = getreg('"')
  call setreg('"', old_reg, old_regtype)
  let &clipboard = old_clipboard
  execute 'FzfRg' selection
endfunction

nnoremap <silent> <leader>A :FzfRgAll<cr>

nnoremap <silent> <leader>f :FzfFiles<cr>
nnoremap <silent> <leader>a :FzfRg<cr>
nnoremap <silent> <leader>b :FzfBuffers<cr>
nnoremap <silent> <leader>l :FzfBLines<cr>
nnoremap <silent> <leader>L :FzfLines<cr>
nnoremap <silent> <leader>m :FzfMarks<cr>
nnoremap <silent> <leader>K :call SearchWordWithRg()<cr>
vnoremap <silent> <leader>K :call SearchVisualSelectionWithRg()<cr>

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-f> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

" }}}

" notational-fzf-vim {{{
Plug 'Alok/notational-fzf-vim', { 'on': 'NV' }
let g:nv_search_paths = ['~/Notes']
let g:nv_use_short_pathnames = 1
let g:nv_create_note_window = 'edit'
nnoremap <silent> <leader>nf :NV<cr>

" }}}

endif

" worp/ale {{{
Plug 'w0rp/ale'
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 1
let g:ale_warn_about_trailing_whitespace = 0

let g:ale_linters = {
      \ 'javascript': ['standard', 'flow'],
      \}
let g:ale_javascript_eslint_options = '--cache'
let g:ale_javascript_prettier_options = '--single-quote --prose-wrap always'

let g:ale_fixers = {
      \ 'javascript': ['prettier'],
      \ 'typescript': ['prettier'],
      \ 'vue': ['prettier'],
      \ 'markdown': ['prettier'],
      \ 'css': ['prettier'],
      \ 'scss': ['prettier'],
      \ 'less': ['prettier'],
      \ 'yaml': ['prettier'],
      \ 'json': ['prettier'],
      \ 'html': ['prettier']
      \}

let g:ale_sign_error = '✖'
let g:ale_sign_warning = '⚠'
let g:ale_statusline_format = ['✖ %d', '⚠ %d', '']

nnoremap <silent> <leader>ef :ALEFix<cr>
" }}}

" vim-fugitive {{{
Plug 'tpope/vim-fugitive'
nnoremap <silent> <leader>gs :Gstatus<cr>
nnoremap <silent> <leader>gd :Gdiff<cr>
nnoremap <silent> <leader>gm :Gdiff develop<cr>
nnoremap <silent> <leader>gb :Gblame<cr>
" }}}

Plug 'junegunn/gv.vim', { 'on': 'GV' }

" ultisnips {{{
Plug 'SirVer/ultisnips', { 'on': [] }

let g:UltiSnipsExpandTrigger       = "<tab>"
let g:UltiSnipsJumpForwardTrigger  = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

let g:UltiSnipsUsePythonVersion = 3

inoremap <silent> <tab> <C-r>=LoadUltiSnips()<cr>

" From @saaguero, this function only runs when UltiSnips is not loaded
function! LoadUltiSnips()
  let l:curpos = getcurpos()
  execute plug#load('ultisnips')
  call cursor(l:curpos[1], l:curpos[2])
  call UltiSnips#ExpandSnippet()
  return ""
endfunction
" }}}

Plug 'christoomey/vim-tmux-navigator'

Plug '~/nnn.vim'
let g:nnn#command = "DISABLE_FILE_OPEN_ON_NAV=1 nnn -l"
let g:nnn#set_default_mappings = 0
let g:nnn#layout = { 'left': '20%' }
let g:nnn#action = {
      \ '<c-t>': 'tab split',
      \ '<c-s>': 'split',
      \ '<c-v>': 'vsplit' }

function! s:Nnn(...)
  let l:dir = get(a:, 1, "")
  let l:opts = get(a:, 2, { "edit": "edit" })
  let l:keypress = get(a:, 3, "")
  call nnn#pick(l:dir, l:opts)
  if strlen(l:keypress) > 0
    call feedkeys(l:keypress)
  endif
endfunction

nnoremap <silent> <leader>nn :call <SID>Nnn()<CR>
nnoremap <silent> <leader>nr :call <SID>Nnn("~/Notes", { "edit": "edit", "layout": { "down": "40%" } }, "tg")<CR>

" vim-sneak {{{
Plug 'justinmk/vim-sneak'
let g:sneak#label      = 1
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

nmap <expr> ; sneak#is_sneaking() ? '<Plug>Sneak_' : ':'
vmap <expr> ; sneak#is_sneaking() ? '<Plug>Sneak_' : ':'
" }}}

Plug 'pgdouyon/vim-evanesco'

" vim-qf {{{
Plug 'romainl/vim-qf'
let g:qf_mapping_ack_style = 1
let g:qf_auto_open_quickfix = 1
let g:qf_auto_open_loclist = 1

nmap <F5> <Plug>qf_qf_toggle
nmap <F6> <Plug>qf_loc_toggle

" }}}

Plug 'wellle/targets.vim'

Plug 'junegunn/vim-peekaboo'

" splitjoin.vim {{{
Plug 'AndrewRadev/splitjoin.vim'
let g:splitjoin_split_mapping = ''
let g:splitjoin_join_mapping = ''
nnoremap gss :SplitjoinSplit<cr>
nnoremap gsj :SplitjoinJoin<cr>
" }}}

" undotree {{{
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }

let g:undotree_WindowLayout       = 2
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_SplitWidth         = 40

nnoremap <silent> <leader>u :UndotreeToggle<cr>
" }}}

" vim-signature {{{
Plug 'kshenoy/vim-signature'
nnoremap <silent> <leader>' :SignatureToggleSigns<cr>
" }}}

" vim-airline {{{
Plug 'vim-airline/vim-airline'

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

let g:airline#extensions#wordcount#enabled = 0
let g:airline#extensions#whitespace#enabled = 0

let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
let g:airline#extensions#tabline#tabs_label = ''
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tabline#tab_min_count = 2
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#ale#enabled = 1

let g:airline_section_y = ''

" }}}

" vim-gitgutter {{{
Plug 'airblade/vim-gitgutter', { 'on': 'GitGutterToggle' }

set updatetime=500
let g:gitgutter_max_signs    = 200
let g:gitgutter_realtime     = 1
let g:gitgutter_eager        = 1
let g:gitgutter_grep_command = 'ag --nocolor'

nnoremap <silent> <leader>gg :GitGutterToggle<cr>
nnoremap <silent> <leader>gh :GitGutterLineHighlightsToggle<cr>
"}}}

Plug 'tomtom/tcomment_vim'

Plug 'rstacruz/vim-closer'

Plug 'tpope/vim-surround'

Plug 'tpope/vim-rsi'

Plug 'tpope/vim-sleuth'

Plug 'tpope/vim-unimpaired'

Plug 'tpope/vim-repeat'

Plug 'tpope/vim-eunuch'

Plug 'tpope/vim-endwise'

Plug 'tpope/vim-capslock'

Plug 'rstacruz/vim-xtract'

Plug 'machakann/vim-highlightedyank'

" goyo.vim {{{
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
let g:goyo_width = 120

nnoremap <silent> <leader>- :Goyo<cr>
function! s:goyo_enter()
  if exists('$TMUX')
    silent !tmux set status off
  endif
endfunction

function! s:goyo_leave()
  if exists('$TMUX')
    silent !tmux set status on
  endif
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" }}}

" limelight.vim {{{
Plug 'junegunn/limelight.vim', { 'on': 'Limelight' }
" }}}

" vim-pencil {{{
Plug 'reedes/vim-pencil'
let g:pencil#wrapModeDefault = 'soft'

augroup pencil
  autocmd!
  autocmd FileType fountain,mardown call pencil#init()
  autocmd FileType fountain         setlocal showbreak=
augroup end

" }}}

Plug 'pangloss/vim-javascript'
let g:javascript_plugin_flow = 1

" vim-jsx {{{
Plug 'mxw/vim-jsx'
let g:jsx_ext_required = 0
" }}}

Plug 'tpope/vim-jdaddy', { 'for': ['javascript', 'javascript.jsx', 'jsx', 'json' ] }

Plug 'othree/html5.vim'

" emmet-vim {{{
Plug 'mattn/emmet-vim'

let g:user_emmet_mode='i'
let g:user_emmet_leader_key = '<c-s>'
let g:user_emmet_settings = {
      \   'javascript.jsx': {
      \     'quote_char': "'",
      \     'extends': 'jsx'
      \   }
      \ }

let g:user_emmet_install_global = 0
autocmd FileType html,ejs,css,sass,scss,less,javascript,jsx,eelixir EmmetInstall
" }}}

Plug 'digitaltoad/vim-pug'

Plug 'hail2u/vim-css3-syntax'

Plug 'ap/vim-css-color', { 'for': [ 'sass', 'scss', 'css', 'less' ] }

Plug 'rstacruz/vim-hyperstyle', { 'for': [ 'sass', 'scss', 'css', 'less' ] }

Plug 'groenewege/vim-less'

Plug 'mcchrish/fountain.vim'

Plug 'arcticicestudio/nord-vim'
let g:nord_italic = 1
let g:nord_italic_comments = 1

Plug 'rakr/vim-one'
Plug 'nightsense/snow'

call plug#end()
" }}}

" ##On plugin loaded {{{

" Load immediately so we can override keymappings later
runtime! plugin/unimpaired.vim

nmap <silent> [q <Plug>QfCprevious
nmap <silent> ]q <Plug>QfCnext
nmap <silent> [l <Plug>QfLprevious
nmap <silent> ]l <Plug>QfLnext

" vim-signature
let g:SignatureEnabledAtStartup = 0

" }}}

" ##Basics {{{

" True color
set termguicolors

" Colorscheme
colorscheme snow

if $VIMNOTES == 1
  set background=light
  let g:airline_theme='snow_light'
else
  set background=dark
  let g:airline_theme='snow_dark'
endif

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

" Flash matching parenthesis
set showmatch
set matchtime=2

" Shorter messages
set shortmess=aIToO

" Allow all mouse
set mouse=a

" Better splitting
set splitbelow
set splitright

" Diff Mode
set diffopt=filler,vertical

" Mode shown by statusline
set noshowmode

" Easy buffer switching
set hidden

set scrolloff=8
set sidescroll=1
set sidescrolloff=10
set synmaxcol=500
set history=1000
set tabpagemax=50

" Fold is just crazy to work with
set nofoldenable

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
" let &showbreak="+>"
let &showbreak="↳ "

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

" Spell
autocmd BufRead,BufNewFile *.md setlocal spell
set complete+=kspell

" Change vim temporary directories
if !has('nvim')

  set undodir=~/.vim/tmp/undo//
  set backupdir=~/.vim/tmp/backup//

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

" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Reselect indent in visual mode
vnoremap < <gv
vnoremap > >gv

" More scroll
nnoremap <c-y> 4<c-y>
nnoremap <c-e> 4<c-e>

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

" Faster save
nnoremap <leader>w :update<cr>

" Delete without overwriting default register
nnoremap vd "_d
xnoremap vd "_d
nnoremap x  "_x
xnoremap x  "_x
nnoremap vD "_D

" Actual Y
nnoremap Y y$

" Clipboard
vnoremap <leader>d "+d
vnoremap <leader>y "+y
vnoremap <leader>p "+p
vnoremap <leader>P "+P
nnoremap <leader>d "+d
nnoremap <leader>y "+y
nnoremap <leader>p "+p
nnoremap <leader>P "+P

" Repeat substitution with flag
nnoremap & :&&<CR>
vnoremap & :&&<CR>

" Repeat macro over all selected lines
vnoremap @ :norm@

nnoremap <C-]> g<C-]>

" Paste mode
set pastetoggle=<F2>

" Select just insert text
nnoremap gV `[V`]

" Edit vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" Terminal
if has('nvim')
  tnoremap <esc> <c-\><c-n>
  tnoremap <c-h> <c-\><c-n><c-w>h
  tnoremap <c-j> <c-\><c-n><c-w>j
  tnoremap <c-k> <c-\><c-n><c-w>k
  tnoremap <c-l> <c-\><c-n><c-w>l

  autocmd BufWinEnter,WinEnter * if &buftype == 'terminal' | startinsert | endif
  autocmd BufLeave * if &buftype == 'terminal' | stopinsert | endif
endif

" Preview Marked 2
nnoremap <F10> :silent !open -a Marked\ 2.app '%:p'<cr>

" }}}

" ##Functions {{{

" Refresh {{{
function! Refresh()
  checktime
  redraw
  echo 'Refreshed!'
endfunction

" Remove search highlight
nnoremap <silent> <leader><cr> :nohlsearch <bar> :call Refresh()<cr>
" }}}

" }}}

" vim:fdm=marker
