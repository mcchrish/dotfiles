" vim-fugitive
nnoremap <silent> <leader>gs :G<cr>
nnoremap <silent> <leader>gd :Gdiff<cr>
nnoremap <silent> <leader>gm :Gdiffsplit develop<cr>
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

" vim-sandwich
nmap s <Nop>
xmap s <Nop>

set updatetime=200
let g:gitgutter_grep = 'rg --color=never'

" vim-gitgutter
let g:gitgutter_sign_added = '┃'
let g:gitgutter_sign_modified = '┃'
let g:gitgutter_sign_removed = '━'
let g:gitgutter_sign_modified_removed = '┳'

highlight GitGutterAdd guifg=#00875f guibg=#262626
highlight GitGutterChange guifg=#005f87 guibg=#262626
highlight GitGutterDelete guifg=#870000 guibg=#262626

nnoremap <silent> <leader>gg :GitGutterToggle<cr>
nnoremap <silent> <leader>gh :GitGutterLineHighlightsToggle<cr>

" vim-javascript
let g:javascript_plugin_flow = 1

" vim-jsx
let g:jsx_ext_required = 0

" vim-vue
let g:vue_pre_processors = []

" vim-matchup
let g:matchup_matchparen_deferred = 1
let g:matchup_matchparen_status_offscreen = 0

" vista.vim
let g:vista#renderer#enable_icon = 0
nnoremap <silent> <leader>v :Vista!!<cr>
