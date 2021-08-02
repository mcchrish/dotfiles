" undotree
let g:undotree_WindowLayout       = 2
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_SplitWidth         = 40

highlight GitSignsAdd guifg=#00875f guibg=#262626
highlight GitSignsChange guifg=#005f87 guibg=#262626
highlight GitSignsDelete guifg=#870000 guibg=#262626

" vim-matchup
let g:matchup_matchparen_deferred = 1
let g:matchup_matchparen_status_offscreen = 0

highlight link WhichKeyFloating LineNr
highlight default link WhichKey GitGutterAdd
highlight default link WhichKeySeperator FoldColumn

" context.vim
let g:context_enabled = 0
let g:context_highlight_border = 'SpecialComment'
