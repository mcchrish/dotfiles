let g:deoplete#enable_at_startup = 1
" <c-h>, <bs>: close popup and delete backword char.
inoremap <expr><c-h> deoplete#smart_close_popup()."\<c-h>"
inoremap <expr><bs> deoplete#smart_close_popup()."\<c-h>"

" close completion menu when pressing enter
inoremap <silent> <cr> <c-r>=<SID>conditional_enter()<cr>
function! s:conditional_enter() abort
  if pumvisible()
    return deoplete#close_popup() . "\<cr>"
  endif
  echo ""
  return "\<cr>"
endfunction

