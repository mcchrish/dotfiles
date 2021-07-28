require 'nvim-treesitter.configs'.setup {
  matchup = {
    enable = true,
  },
  highlight = {
    enable = true
  },
  indent = {
    enable = true
  },
}

require 'gitsigns'.setup {
  signs = {
    add          = { text = '┃' },
    change       = { text = '┃' },
    delete       = { text = '━' },
    topdelete    = { text = '━' },
    changedelete = { text = '┳' },
  }
}
