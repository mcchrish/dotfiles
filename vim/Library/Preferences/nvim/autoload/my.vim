" Remove search highlight
function! my#refresh()
  nohlsearch
  checktime
  redraw
  echo 'Refreshed!'
endfunction
