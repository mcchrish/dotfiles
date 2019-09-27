" Colorscheme
set termguicolors

if $VIMNOTES == 1
  set background=light
  let g:airline_theme='snow_light'
  set statusline=%#StatusLineNC#\ %t%m%=%w%q\ %p%%\ %l/%L\ ㏑\ :\ %v\ 
else
  set background=dark
  let g:airline_theme='snow_dark'
endif


if !exists('$TMUX')
  let g:extend_highlight#extend_list = [
        \ ['Comment', 'Comment', { '+gui': ['italic'] }]
        \ ]
endif

colorscheme snow
