local g = vim.g

g.mapleader = [[ ]]
g.python_host_prog = '/usr/bin/python2'
g.python3_host_prog = '/usr/bin/python3'
g.did_install_default_menus = 1

local disabled_built_ins = {
  'matchit',
  '2html_plugin',
  'getscript',
  'getscriptPlugin',
  'gzip',
  'logiPat',
  'netrw',
  'netrwFileHandlers',
  'netrwPlugin',
  'netrwSettings',
  'rrhelper',
  'tar',
  'tarPlugin',
  'tutor_mode_plugin',
  'vimball',
  'vimballPlugin',
  'zip',
  'zipPlugin',
}

for i = 1, #disabled_built_ins do
  g['loaded_' .. disabled_built_ins[i]] = 1
end

g.coc_global_extensions = {
  'coc-tsserver',
  'coc-json',
  'coc-vetur',
  'coc-eslint',
  'coc-prettier',
  'coc-snippets',
  'coc-phpls',
  'coc-html',
  'coc-css',
  'https://github.com/rodrigore/coc-tailwind-intellisense',
}

return require'packer'.startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'pgdouyon/vim-yin-yang'
  use '/usr/local/opt/fzf'
  use 'junegunn/fzf.vim'
  use '~/vimming/nnn.vim'
  use 'andymass/vim-matchup'
  use 'justinmk/vim-sneak'
  use 'pgdouyon/vim-evanesco'
  use 'tpope/vim-eunuch'
  use 'tpope/vim-unimpaired'
  use 'tpope/vim-repeat'
  use 'tpope/vim-sleuth'
  use 'tpope/vim-rsi'
  use 'machakann/vim-sandwich'

  use { 'neoclide/coc.nvim', branch = 'release' }

  use { 'wellle/context.vim',  cmd = 'ContextToggle' }
  use 'liuchengxu/vim-which-key'
  use 'tpope/vim-fugitive'
  use { 'rbong/vim-flog', cmd = { 'Flog', 'Flogsplit' } }
  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = [[require('config.gitsigns')]],
    event = 'BufEnter',
  }
  use { 'mbbill/undotree', cmd = 'UndotreeToggle' }
  use { 'brooth/far.vim', cmd = 'Far' }
  use {
    'nvim-treesitter/nvim-treesitter',
    config = [[require('config.treesitter')]],
    run = ':TSUpdate',
  }
  use { 'mattn/emmet-vim', cmd = 'EmmetInstall' }
  -- use 'mcchrish/fountain.vim'
end)
