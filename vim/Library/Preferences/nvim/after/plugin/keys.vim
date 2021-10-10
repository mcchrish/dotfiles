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
nnoremap <leader>w <cmd>silent update<cr>

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

nnoremap <leader><cr> <cmd>call my#refresh()<cr>

" vim-fugitive
nnoremap <leader>gs <cmd>G<cr>
nnoremap <leader>gd <cmd>Gdiffsplit<cr>
nnoremap <leader>gb <cmd>G blame<cr>

" undotree
nnoremap <leader>u <cmd>UndotreeToggle<cr>

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
nnoremap <leader>gg <cmd>Gitsigns toggle_signs<cr>
nnoremap <leader>gh <cmd>Gitsigns toggle_linehl<cr>

" Fzf
nnoremap <leader>A <cmd>lua require "fzf-lua".grep({ search = "", rg_opts = "--column --line-number --no-heading --color=always --smart-case --colors='path:fg:white' --hidden" })<cr>
nnoremap <leader>a <cmd>lua require "fzf-lua".grep({ search = "" })<cr>
nnoremap <leader>K <cmd>lua require "fzf-lua".grep_cword()<cr>
vnoremap <leader>K <cmd>lua require "fzf-lua".grep_visual()<cr>
nnoremap <leader>f <cmd>lua require "fzf-lua".files()<cr>
nnoremap <leader>d <cmd>lua require "fzf-lua".files({ cwd = vim.fn.expand('%:h') })<cr>
nnoremap <leader>b <cmd>lua require "fzf-lua".buffers()<cr>
nnoremap <leader>l <cmd>lua require "fzf-lua".blines()<cr>
nnoremap <leader>L <cmd>lua require "fzf-lua".lines()<cr>
nnoremap <leader>m <cmd>lua require "fzf-lua".marks()<cr>
nnoremap Q <cmd>lua require "fzf-lua".command_history()<cr>

" imap <c-x><c-k> <plug>(fzf-complete-word)
" imap <c-x><c-f> <plug>(fzf-complete-path)
" imap <c-x><c-l> <plug>(fzf-complete-line)

nnoremap <leader>nn <cmd>NnnPicker<cr>
nnoremap <leader>nc <cmd>NnnPicker %:h<cr>
autocmd FileType nnn tnoremap <nowait><buffer><silent> <C-]> q

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

inoremap <silent><expr> <cr>  pumvisible() ? (complete_info().selected == -1 ? '<c-e><cr>' : '<c-y>') : '<cr>'
inoremap <silent><expr> <esc> pumvisible() ? '<c-e><esc>' : '<esc>'
inoremap <silent><expr> <bs>  pumvisible() ? '<c-e><bs>'  : '<bs>'
inoremap <silent><expr> <c-w> pumvisible() ? '<c-e><c-w>' : '<c-w>'
inoremap <silent><expr> <c-u> pumvisible() ? '<c-e><c-u>' : '<c-u>'

nnoremap <leader>xx <cmd>TroubleToggle<cr>
nnoremap <leader>xw <cmd>TroubleToggle lsp_workspace_diagnostics<cr>
nnoremap <leader>xd <cmd>TroubleToggle lsp_document_diagnostics<cr>
nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>
nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>
nnoremap gR <cmd>TroubleToggle lsp_references<cr>
