" notational-fzf-vim
let g:nv_search_paths = ['~/Notes']
let g:nv_use_short_pathnames = 1
let g:nv_create_note_window = 'edit'
nnoremap <silent> <leader>nf :NV<cr>

if $MINIMAL
  finish
endif

" vim-fugitive
nnoremap <silent> <leader>gs :Gstatus<cr>
nnoremap <silent> <leader>gd :Gdiff<cr>
nnoremap <silent> <leader>gm :Gdiff develop<cr>
nnoremap <silent> <leader>gb :Gblame<cr>

" splitjoin.vim
let g:splitjoin_split_mapping = ''
let g:splitjoin_join_mapping = ''
nnoremap gss :SplitjoinSplit<cr>
nnoremap gsj :SplitjoinJoin<cr>

" undotree
let g:undotree_WindowLayout       = 2
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_SplitWidth         = 40

nnoremap <silent> <leader>u :UndotreeToggle<cr>

" vim-signature
let g:SignatureEnabledAtStartup = 0
nnoremap <silent> <leader>' :SignatureToggleSigns<cr>

set updatetime=500
let g:gitgutter_max_signs    = 200
let g:gitgutter_realtime     = 1
let g:gitgutter_eager        = 1
let g:gitgutter_grep_command = 'ag --nocolor'

" vim-gitgutter
nnoremap <silent> <leader>gg :GitGutterToggle<cr>
nnoremap <silent> <leader>gh :GitGutterLineHighlightsToggle<cr>

" vim-javascript
let g:javascript_plugin_flow = 1

" vim-jsx
let g:jsx_ext_required = 0

" vim-polyglot
let g:polyglot_disabled = ['markdown', 'md']
