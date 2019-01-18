" Colorscheme
colorscheme snow

if $VIMNOTES == 1
  set background=light
  let g:airline_theme='snow_light'
  set statusline=%#StatusLineNC#\ %t%m%=%w%q\ %p%%\ %l/%L\ ㏑\ :\ %v\ 
  hi Comment ctermfg=243 ctermbg=NONE guifg=#6d7782 guibg=NONE guisp=NONE cterm=NONE gui=italic
else
  set background=dark
  hi Comment ctermfg=246 ctermbg=NONE guifg=#8c95a0 guibg=NONE guisp=NONE cterm=NONE gui=italic
  let g:airline_theme='snow_dark'
endif
