" Remove search highlight
function! my#refresh()
  nohlsearch
  checktime
  redraw
  silent CocRestart
  echo 'Refreshed!'
endfunction

function! my#save_file_to_notes()
  let l:filename = input('filename: ', getline(1))
  execute 'write '.g:nv_search_paths[0].'/'.l:filename.'.md'
endfunction

" Preview Marked 2
function! my#preview_markdown(file, open_marked)
  let l:preview_file = '~/.local/share/marked-preview.md'
  call system('cp -f ' . shellescape(expand(a:file)) . ' ' . l:preview_file)
  if a:open_marked == v:true
    call system('open -a Marked\ 2.app ' . l:preview_file)
  endif
endfunction
