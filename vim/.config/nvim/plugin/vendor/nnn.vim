let g:nnn#command = 'nnn -o'
let g:nnn#set_default_mappings = 0

let g:nnn#layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'Debug' } }

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
      \ '<c-o>': function('<SID>put_to_register') }

autocmd! FileType nnn tnoremap <buffer> <esc> q
