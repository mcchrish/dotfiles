"      _
"  _ _|_|_____
" | | | |     |
"  \_/|_|_|_|_|
"

let mapleader = "\<space>"

" disable some builtin plugins
let g:did_install_default_menus = 1
let g:loaded_2html_plugin       = 1
let g:loaded_getscript          = 1
let g:loaded_getscriptPlugin    = 1
let g:loaded_gzip               = 1
let g:loaded_logiPat            = 1
let g:loaded_netrw              = 1
let g:loaded_netrwFileHandlers  = 1
let g:loaded_netrwPlugin        = 1
let g:loaded_netrwSettings      = 1
let g:loaded_rrhelper           = 1
let g:loaded_tar                = 1
let g:loaded_tarPlugin          = 1
let g:loaded_tutor_mode_plugin  = 1
let g:loaded_vimball            = 1
let g:loaded_vimballPlugin      = 1
let g:loaded_zip                = 1
let g:loaded_zipPlugin          = 1

let g:python_host_prog          = '/usr/bin/python'
let g:python3_host_prog         = '/usr/local/bin/python3'

call plug#begin('~/.local/share/nvim/vendor')

Plug 'w0rp/ale'
Plug 'nightsense/snow'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'Alok/notational-fzf-vim', { 'on': 'NV' }
Plug 'mcchrish/nnn.vim'
Plug 'mcchrish/extend-highlight.vim'
Plug 'justinmk/vim-sneak'
Plug 'pgdouyon/vim-evanesco'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'machakann/vim-sandwich'
Plug 'tpope/vim-rsi'
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
Plug 'junegunn/limelight.vim', { 'on': 'Limelight' }

if $MINIMAL
  call plug#end()
  finish
endif

if has('nvim')
  Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
  Plug 'SirVer/ultisnips', { 'on': [] }
endif

Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim', { 'on': 'GV' }
Plug 'romainl/vim-qf'
Plug 'wellle/targets.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'junegunn/vim-easy-align'
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
Plug 'kshenoy/vim-signature'
Plug 'airblade/vim-gitgutter', { 'on': 'GitGutterToggle' }
Plug 'brooth/far.vim', { 'on': 'Far' }
Plug 'tomtom/tcomment_vim'
Plug 'mcchrish/vim-closer'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-sleuth'
Plug 'machakann/vim-highlightedyank'
Plug 'chemzqm/vim-jsx-improve'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'othree/html5.vim'
Plug 'posva/vim-vue'
Plug 'hail2u/vim-css3-syntax'
Plug 'ap/vim-css-color', { 'for': [ 'sass', 'scss', 'css', 'less' ] }
Plug 'mattn/emmet-vim'
Plug 'mcchrish/fountain.vim'

call plug#end()
