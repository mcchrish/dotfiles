let g:nnn#command = 'nnn -o -C'
let g:nnn#set_default_mappings = 0
let g:nnn#statusline = 0
let g:nnn#replace_netrw = 1
let g:nnn#layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

function! s:put_to_register(lines)
  let joined_lines = join(a:lines, '\n')
  if len(a:lines) > 1
    let joined_lines .= '\n'
  endif
  echom joined_lines
  let @+ = joined_lines
endfunction

let g:nnn#action = {
      \ '<c-t>': 'tab split',
      \ '<c-s>': 'split',
      \ '<c-v>': 'vsplit',
      \ '<c-o>': function('<SID>put_to_register')
      \ }
