" Remove search highlight
function! my#refresh()
  nohlsearch
  checktime
  redraw
  echo 'Refreshed!'
endfunction

function! my#save_file_to_notes()
  let l:filename = input('filename: ', getline(1))
  execute 'write '.g:nv_search_paths[0].'/'.l:filename.'.md'
endfunction

