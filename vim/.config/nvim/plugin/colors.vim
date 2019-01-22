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

function! s:set_highlights()
  call extend_highlight#extend('Function', 'ALEVirtualTextError', { 'gui': ['italic'] })
  call extend_highlight#extend('TypeDef', 'ALEVirtualTextWarning', { 'gui': ['italic'] })
  call extend_highlight#extend('ErrorMsg', 'ALEError', { '+gui': ['italic'] })
  call extend_highlight#extend('ErrorMsg', 'ALEWarning', { '+gui': ['italic'] })

  call extend_highlight#extend('Comment', 'Comment', { '+gui': ['italic'] })
endfunction

augroup load_hi
  autocmd!
  autocmd ColorScheme * call <SID>set_highlights()
augroup END

colorscheme snow
