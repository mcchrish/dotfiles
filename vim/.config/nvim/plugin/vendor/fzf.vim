let $FZF_DEFAULT_OPTS="--color=16 --color='fg+:#eeeeee,bg+:#4e4e4e,hl:#00875f,hl+:#00875f,marker:#eeeeee,prompt:#767676' --layout=reverse"
let g:fzf_command_prefix = 'Fzf'
let g:fzf_buffers_jump = 1
let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit'
      \ }
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'Debug' } }

command! -bang -nargs=* FzfRgAll call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case --hidden ".shellescape(<q-args>), 1, { 'options': ['--color', 'hl:#00875f,hl+:#00875f'] }, <bang>0)
command! -bang -nargs=* FzfRg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, { 'options': ['--color', 'hl:#00875f,hl+:#00875f'] }, <bang>0)

" Search current word under cursor
function! SearchWordWithRg()
  execute 'FzfRg' expand('<cword>')
endfunction

" Search visual selected
function! SearchVisualSelectionWithRg() range
  let old_reg = getreg('"')
  let old_regtype = getregtype('"')
  let old_clipboard = &clipboard
  set clipboard&
  normal! ""gvy
  let selection = getreg('"')
  call setreg('"', old_reg, old_regtype)
  let &clipboard = old_clipboard
  execute 'FzfRg' selection
endfunction

nnoremap <silent> <leader>A :FzfRgAll<cr>

nnoremap <silent> <leader>f :FzfFiles<cr>
nnoremap <silent> <leader>c :FzfFiles <c-r>=expand("%:h")<cr>/<cr>
nnoremap <silent> <leader>a :FzfRg<cr>
nnoremap <silent> <leader>b :FzfBuffers<cr>
nnoremap <silent> <leader>l :FzfBLines<cr>
nnoremap <silent> <leader>L :FzfLines<cr>
nnoremap <silent> <leader>m :FzfMarks<cr>
nnoremap <silent> <leader>K :call SearchWordWithRg()<cr>
vnoremap <silent> <leader>K :call SearchVisualSelectionWithRg()<cr>

nnoremap <silent> <leader>ev :FzfFiles ~/.dotfiles<cr>

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-f> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

function! s:fzf_statusline()
  setlocal statusline=%#StatusLineTerm#\ fzf\ %#StatusLineTermNC#
endfunction
autocmd! User FzfStatusLine call <SID>fzf_statusline()

" Close fzf when esc
autocmd! FileType fzf tnoremap <buffer> <esc> <c-c>
