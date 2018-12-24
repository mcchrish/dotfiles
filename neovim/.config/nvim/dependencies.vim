call plug#begin('~/.config/nvim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'w0rp/ale'
Plug 'nightsense/snow'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'Alok/notational-fzf-vim', { 'on': 'NV' }
Plug 'mcchrish/nnn.vim'
Plug 'justinmk/vim-sneak'
Plug 'pgdouyon/vim-evanesco'
Plug 'christoomey/vim-tmux-navigator'
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
endif

Plug 'vim-airline/vim-airline'
Plug 'junegunn/gv.vim', { 'on': 'GV' }
Plug 'SirVer/ultisnips', { 'on': [] }
Plug 'romainl/vim-qf'
Plug 'wellle/targets.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
Plug 'kshenoy/vim-signature'
Plug 'airblade/vim-gitgutter', { 'on': 'GitGutterToggle' }
Plug 'tomtom/tcomment_vim'
Plug 'rstacruz/vim-closer'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-capslock'
Plug 'rstacruz/vim-xtract'
Plug 'machakann/vim-highlightedyank'
Plug 'reedes/vim-pencil'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'othree/html5.vim'
Plug 'mattn/emmet-vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'ap/vim-css-color', { 'for': [ 'sass', 'scss', 'css', 'less' ] }
Plug 'rstacruz/vim-hyperstyle', { 'for': [ 'sass', 'scss', 'css', 'less' ] }
Plug 'mcchrish/fountain.vim'

call plug#end()
