" Remove search highlight
function! my#refresh()
  nohlsearch
  checktime
  redraw
  silent CocRestart
  echo 'Refreshed!'
endfunction
