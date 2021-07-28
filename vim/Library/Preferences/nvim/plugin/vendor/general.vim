" tcomment_vim
let g:tcomment_maps = 0

" splitjoin.vim
let g:splitjoin_split_mapping = ''
let g:splitjoin_join_mapping = ''

" undotree
let g:undotree_WindowLayout       = 2
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_SplitWidth         = 40

highlight GitSignsAdd guifg=#00875f guibg=#262626
highlight GitSignsChange guifg=#005f87 guibg=#262626
highlight GitSignsDelete guifg=#870000 guibg=#262626

" vim-vue
let g:vue_pre_processors = []

" vim-matchup
let g:matchup_matchparen_deferred = 1
let g:matchup_matchparen_status_offscreen = 0

" vista.vim
let g:vista#renderer#enable_icon = 0
let g:vista_default_executive = 'coc'
let g:vista_sidebar_width = 40

" vim-which-key
let g:which_key_use_floating_win = 1

highlight link WhichKeyFloating LineNr
highlight default link WhichKey GitGutterAdd
highlight default link WhichKeySeperator FoldColumn

" context.vim
let g:context_enabled = 0
let g:context_highlight_border = 'SpecialComment'
