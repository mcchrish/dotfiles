" Colorscheme
set termguicolors

set background=dark
let g:airline_theme='snow_dark'


if !exists('$TMUX')
  let g:extend_highlight#extend_list = [
        \ ['Comment', 'Comment', { '+gui': ['italic'] }]
        \ ]
endif

colorscheme snow
