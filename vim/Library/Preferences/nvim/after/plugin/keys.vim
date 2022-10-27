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
nnoremap <leader>w <cmd>silent update<cr>

" Delete without overwriting default register
nnoremap vd "_d
xnoremap vd "_d
nnoremap x  "_x
xnoremap x  "_x
nnoremap vD "_D

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

" vim-fugitive
nnoremap <leader>gs <cmd>G<cr>
nnoremap <leader>gd <cmd>Gdiffsplit<cr>
nnoremap <leader>gb <cmd>G blame<cr>

" undotree
nnoremap <leader>u <cmd>UndotreeToggle<cr>

" gitsigns
nnoremap <leader>gg <cmd>Gitsigns toggle_signs<cr>
nnoremap <leader>gh <cmd>Gitsigns toggle_linehl<cr>

nmap ss <plug>(leap-forward-to)
nmap S <plug>(leap-backward-to)

xmap ss <plug>(leap-forward-to)
xmap S <plug>(leap-backward-to)

omap ss <plug>(leap-forward-to)
omap S <plug>(leap-backward-to)

xmap x <plug>(leap-forward-till)
xmap X <plug>(leap-backward-till)

omap x <plug>(leap-forward-till)
omap X <plug>(leap-backward-till)

nmap gs <plug>(leap-cross-window)
xmap gs <plug>(leap-cross-window)
omap gs <plug>(leap-cross-window)

" imap <c-x><c-k> <plug>(fzf-complete-word)
" imap <c-x><c-f> <plug>(fzf-complete-path)
" imap <c-x><c-l> <plug>(fzf-complete-line)

nnoremap <leader>nn <cmd>NnnPicker<cr>
nnoremap <leader>nc <cmd>NnnPicker %:h<cr>

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <plug>(EasyAlign)

nnoremap <leader>xx <cmd>TroubleToggle<cr>
nnoremap <leader>xw <cmd>TroubleToggle lsp_workspace_diagnostics<cr>
nnoremap <leader>xd <cmd>TroubleToggle lsp_document_diagnostics<cr>
nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>
nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>
nnoremap gR <cmd>TroubleToggle lsp_references<cr>

" press <tab> to expand or jump in a snippet. These can also be mapped separately
" via <plug>luasnip-expand-snippet and <plug>luasnip-jump-next.
imap <silent><expr> <tab> luasnip#expand_or_jumpable() ? '<plug>luasnip-expand-or-jump' : '<tab>' 
imap <s-tab> <plug>luasnip-jump-prev
