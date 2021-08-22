nnoremap <f2> <cmd>tabe $XDG_CONFIG_HOME/nvim/after/plugin/keys.vim<cr>

" Move vertically by visual line
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap gj j
nnoremap gk k

" Move visual block
vnoremap J :m '>+1<cr>gv=gv
vnoremap K :m '<-2<cr>gv=gv

" Reselect indent in visual mode
vnoremap < <gv
vnoremap > >gv

" Remap esc
inoremap jk <esc>

" Faster save
nnoremap <silent> <leader>w <cmd>silent update<cr>

" Delete without overwriting default register
nnoremap vd "_d
xnoremap vd "_d
nnoremap x  "_x
xnoremap x  "_x
nnoremap vD "_D

" Actual Y
nnoremap Y y$

" Repeat substitution with flag
nnoremap & <cmd>&&<CR>
vnoremap & <cmd>&&<CR>

" Repeat macro over all selected lines
vnoremap @ :norm@

nnoremap <c-]> g<c-]>

" Select just insert text
nnoremap gV `[V`]

" Window navigation
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

nnoremap <silent> <leader><cr> <cmd>call my#refresh()<cr>

" vim-fugitive
nnoremap <silent> <leader>gs <cmd>G<cr>
nnoremap <silent> <leader>gd <cmd>Gdiffsplit<cr>
nnoremap <silent> <leader>gb <cmd>G blame<cr>
nnoremap <silent> <leader>gl <cmd>Flog<cr>

" undotree
nnoremap <silent> <leader>u <cmd>UndotreeToggle<cr>

" vim-sandwich
nmap s <Nop>
xmap s <Nop>

" sneak
nmap ss <Plug>Sneak_s
xmap ss <Plug>Sneak_s

"replace 'f' with 1-char Sneak
nmap f <Plug>Sneak_f
nmap F <Plug>Sneak_F
xmap f <Plug>Sneak_f
xmap F <Plug>Sneak_F
omap f <Plug>Sneak_f
omap F <Plug>Sneak_F
"replace 't' with 1-char Sneak
nmap t <Plug>Sneak_t
nmap T <Plug>Sneak_T
xmap t <Plug>Sneak_t
xmap T <Plug>Sneak_T
omap t <Plug>Sneak_t
omap T <Plug>Sneak_T

nmap <expr> ; sneak#is_sneaking() ? '<Plug>Sneak_;' : ':'
vmap <expr> ; sneak#is_sneaking() ? '<Plug>Sneak_;' : ':'

" gitsigns
nnoremap <silent> <leader>gg <cmd>Gitsigns toggle_signs<cr>
nnoremap <silent> <leader>gh <cmd>Gitsigns toggle_linehl<cr>

" Fzf
" Search current word under cursor
function! SearchWordWithRg()
  execute 'Rg' expand('<cword>')
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
  execute 'Rg' selection
endfunction

nnoremap <silent> <leader>A <cmd>RgAll<cr>
nnoremap <silent> <leader>a <cmd>Rg<cr>
nnoremap <silent> <leader>K <cmd>call SearchWordWithRg()<cr>
vnoremap <silent> <leader>K <cmd>call SearchVisualSelectionWithRg()<cr>
nnoremap <silent> <leader>f <cmd>Files<cr>
nnoremap <silent> <leader>d <cmd>Files %:h<cr>
nnoremap <silent> <leader>b <cmd>Buffers<cr>
nnoremap <silent> <leader>l <cmd>BLines<cr>
nnoremap <silent> <leader>L <cmd>Lines<cr>
nnoremap <silent> <leader>m <cmd>Marks<cr>
nnoremap <silent> Q <cmd>History:<cr>

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

nnoremap <silent> <leader>nn <cmd>NnnPicker<cr>
nnoremap <silent> <leader>nc <cmd>NnnPicker %:h<cr>

" " Use <c-l> for trigger snippet expand.
" imap <c-l> <plug>(coc-snippets-expand)

" " Use <c-j> for select text for visual placeholder of snippet.
" vmap <c-j> <plug>(coc-snippets-select)

" " Use <c-j> for both expand and jump (make expand higher priority.)
" imap <c-j> <plug>(coc-snippets-expand-jump)

" context.vim
nnoremap <leader>t <cmd>ContextToggle<cr>

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
