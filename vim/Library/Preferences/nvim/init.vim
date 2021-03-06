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

let g:python_host_prog          = '/usr/bin/python2'
let g:python3_host_prog         = '/usr/bin/python3'

call plug#begin('$XDG_DATA_HOME/nvim/vendor')

Plug 'pgdouyon/vim-yin-yang'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug '~/vimming/nnn.vim'
" Plug '~/vimming/info-window.nvim'
Plug 'andymass/vim-matchup'
Plug 'justinmk/vim-sneak'
" Plug 'ggandor/lightspeed.nvim'
Plug 'pgdouyon/vim-evanesco'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-rsi'
" Plug 'tpope/vim-rhubarb'
Plug 'machakann/vim-sandwich'

Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'liuchengxu/vista.vim'

Plug 'wellle/context.vim', { 'on': 'ContextToggle' }
Plug 'liuchengxu/vim-which-key'
Plug 'tpope/vim-fugitive'
Plug 'rbong/vim-flog', { 'on': ['Flog', 'Flogsplit'] }
Plug 'rhysd/git-messenger.vim'
Plug 'airblade/vim-gitgutter'
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
Plug 'wellle/targets.vim'
Plug 'AndrewRadev/splitjoin.vim'
" Plug 'junegunn/vim-easy-align'
Plug 'brooth/far.vim', { 'on': 'Far' }
Plug 'tomtom/tcomment_vim', { 'on': 'TComment' }
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'mattn/emmet-vim', { 'on': 'EmmetInstall' }
Plug 'posva/vim-vue'
" Plug 'mcchrish/fountain.vim'
Plug 'rust-lang/rust.vim'
Plug 'jparise/vim-graphql'

call plug#end()

let g:coc_global_extensions = [
                  \ 'coc-tsserver',
                  \ 'coc-json',
                  \ 'coc-vetur',
                  \ 'coc-eslint',
                  \ 'coc-prettier',
                  \ 'coc-snippets',
                  \ 'coc-phpls',
                  \ 'coc-html',
                  \ 'coc-css',
                  \ 'https://github.com/rodrigore/coc-tailwind-intellisense',
                  \ 'coc-rust-analyzer'
                  \ ]
