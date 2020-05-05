let mapleader = "\<space>"

" disable some builtin plugins
let g:loaded_matchit            = 1
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

Plug 'pgdouyon/vim-yin-yang'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug '~/vimming/nnn.vim'
Plug '~/vimming/info-window.nvim'
Plug 'andymass/vim-matchup'
Plug 'justinmk/vim-sneak'
Plug 'junegunn/vim-slash'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-rsi'
Plug 'machakann/vim-sandwich'
Plug 'machakann/vim-highlightedyank'
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }

Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'liuchengxu/vista.vim'

Plug 'wellle/context.vim', { 'on': 'ContextToggle' }
Plug 'liuchengxu/vim-which-key'
Plug 'tpope/vim-fugitive'
Plug 'rbong/vim-flog', { 'on': ['Flog', 'FlogSplit'] }
Plug 'rhysd/git-messenger.vim'
Plug 'wellle/targets.vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'junegunn/vim-peekaboo'
" Plug 'junegunn/vim-easy-align'
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
Plug 'airblade/vim-gitgutter'
Plug 'brooth/far.vim', { 'on': 'Far' }
Plug 'tomtom/tcomment_vim', { 'on': 'TComment' }
Plug 'neoclide/vim-jsx-improve'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'mattn/emmet-vim', { 'on': 'EmmetInstall' }
Plug 'posva/vim-vue'
Plug 'mcchrish/fountain.vim'
Plug 'rust-lang/rust.vim'

let g:coc_global_extensions = [
                  \ 'coc-tsserver',
                  \ 'coc-json',
                  \ 'coc-vetur',
                  \ 'coc-eslint',
                  \ 'coc-prettier',
                  \ 'coc-highlight',
                  \ 'coc-snippets',
                  \ 'coc-phpls',
                  \ 'coc-html',
                  \ 'coc-css',
                  \ 'coc-rust-analyzer'
                  \ ]

call plug#end()
