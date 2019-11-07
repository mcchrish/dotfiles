let g:nnn#command = 'nnn -o'
let g:nnn#set_default_mappings = 0

function! s:layout()
  let buf = nvim_create_buf(v:false, v:true)

  let height = &lines - (float2nr(&lines / 3))
  let width = float2nr(&columns - (&columns * 1 / 3))

  let opts = {
        \ 'relative': 'editor',
        \ 'row': 2,
        \ 'col': 8,
        \ 'width': width,
        \ 'height': height
        \ }

  call nvim_open_win(buf, v:true, opts)
endfunction
let g:nnn#layout = 'call ' . string(function('<SID>layout')) . '()'

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

function! s:Nnn(...)
  let l:dir = get(a:, 1, '')
  let l:opts = get(a:, 2, { 'edit': 'edit' })
  let l:keypress = get(a:, 3, '')
  call nnn#pick(l:dir, l:opts)
  if strlen(l:keypress) > 0
    call feedkeys(l:keypress)
  endif
endfunction


nnoremap <silent> <leader>nn :call <SID>Nnn()<CR>
nnoremap <silent> <leader>nc :call <SID>Nnn(expand('%:h'))<CR>
nnoremap <silent> <leader>nt :call <SID>Nnn('', { 'edit': function('<SID>put_to_register') })<CR>
nnoremap <silent> <leader>nd :call <SID>Nnn('~/.dotfiles', { 'edit': 'edit', 'layout': { 'down': '40%' } }, 'tg.')<CR>

autocmd! FileType nnn tnoremap <buffer> <esc> q
