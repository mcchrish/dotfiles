let g:nnn#command = "DISABLE_FILE_OPEN_ON_NAV=1 nnn -l"
let g:nnn#set_default_mappings = 0
let g:nnn#layout = { 'left': '20%' }
let g:nnn#action = {
      \ '<c-t>': 'tab split',
      \ '<c-s>': 'split',
      \ '<c-v>': 'vsplit' }

function! s:Nnn(...)
  let l:dir = get(a:, 1, "")
  let l:opts = get(a:, 2, { "edit": "edit" })
  let l:keypress = get(a:, 3, "")
  call nnn#pick(l:dir, l:opts)
  if strlen(l:keypress) > 0
    call feedkeys(l:keypress)
  endif
endfunction

nnoremap <silent> <leader>nn :call <SID>Nnn()<CR>
nnoremap <silent> <leader>nr :call <SID>Nnn("~/Notes", { "edit": "edit", "layout": { "down": "40%" } }, "tg")<CR>
nnoremap <silent> <leader>nd :call <SID>Nnn("~/dotfiles", { "edit": "edit", "layout": { "down": "40%" } }, "tg.")<CR>
