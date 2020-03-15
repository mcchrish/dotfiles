" Colorscheme
set termguicolors

set background=dark

if !exists('$TMUX')
  let g:extend_highlight#extend_list = [
        \ ['Comment', 'Comment', { '+gui': ['italic'] }]
        \ ]
endif

colorscheme yin
