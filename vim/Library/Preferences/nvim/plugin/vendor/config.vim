" undotree
let g:undotree_WindowLayout       = 2
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_SplitWidth         = 40

highlight GitSignsAdd guifg=#00875f guibg=#262626
highlight GitSignsChange guifg=#005f87 guibg=#262626
highlight GitSignsDelete guifg=#870000 guibg=#262626

" vim-matchup
let g:matchup_matchparen_deferred = 1
let g:matchup_matchparen_offscreen = {}

" context.vim
let g:context_enabled = 0
let g:context_highlight_border = 'SpecialComment'

" sneak
let g:sneak#label = 1
let g:sneak#use_ic_scs = 1

" coq
" conflicts with window nav keys. Disable for now
let g:coq_settings = { 'auto_start': v:true, 'keymap.jump_to_mark': '' }

let g:vim_vue_plugin_config = {
                  \ 'syntax': {
                  \   'template': ['html'],
                  \   'script': ['javascript'],
                  \   'style': ['css'],
                  \ },
                  \ 'full_syntax': [],
                  \ 'initial_indent': [],
                  \ 'attribute': 0,
                  \ 'keyword': 0,
                  \ 'foldexpr': 0,
                  \ 'debug': 0,
                  \ }
