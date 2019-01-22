call plug#begin('~/.local/share/nvim/vendor')

Plug 'w0rp/ale'
Plug 'nightsense/snow'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'Alok/notational-fzf-vim', { 'on': 'NV' }
Plug 'mcchrish/nnn.vim'
Plug 'mcchrish/extended-highlight.vim'
Plug 'justinmk/vim-sneak'
Plug 'pgdouyon/vim-evanesco'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-rsi'
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
Plug 'junegunn/limelight.vim', { 'on': 'Limelight' }

if $MINIMAL
  call plug#end()
  finish
endif

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'on': [], 'do': ':UpdateRemotePlugins' }
  Plug 'SirVer/ultisnips', { 'on': [] }
endif

Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim', { 'on': 'GV' }
Plug 'romainl/vim-qf'
Plug 'wellle/targets.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
Plug 'kshenoy/vim-signature'
Plug 'airblade/vim-gitgutter', { 'on': 'GitGutterToggle' }
Plug 'brooth/far.vim', { 'on': 'Far' }
Plug 'tomtom/tcomment_vim'
Plug 'rstacruz/vim-closer'
Plug 'ap/vim-css-color'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-sleuth'
Plug 'machakann/vim-highlightedyank'
" Plug 'reedes/vim-pencil'
Plug 'sheerun/vim-polyglot'
Plug 'mattn/emmet-vim'
Plug 'mcchrish/fountain.vim'

call plug#end()
