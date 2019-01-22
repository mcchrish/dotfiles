" Colorscheme
colorscheme snow

if $VIMNOTES == 1
  set background=light
  let g:airline_theme='snow_light'
  set statusline=%#StatusLineNC#\ %t%m%=%w%q\ %p%%\ %l/%L\ ㏑\ :\ %v\ 
else
  set background=dark
  let g:airline_theme='snow_dark'
endif

augroup load_hi
  autocmd!
  autocmd VimEnter,ColorScheme * call extend_highlight#extend('Comment', 'Comment', { '+gui': ['italic'] })
augroup END
