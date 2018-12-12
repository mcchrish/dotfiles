function! Refresh()
  checktime
  redraw
  echo 'Refreshed!'
endfunction

" Remove search highlight
nnoremap <silent> <leader><cr> :nohlsearch <bar> :call Refresh()<cr>

function! SaveFileToNotes()
  let l:filename = input('filename: ', getline(1))
  execute 'write '.g:nv_search_paths[0].'/'.l:filename.'.md'
endfunction

nnoremap <silent> <leader>ns :call SaveFileToNotes()<cr>
