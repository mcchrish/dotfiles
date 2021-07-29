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

" vim-which-key
let g:which_key_use_floating_win = 1

highlight link WhichKeyFloating LineNr
highlight default link WhichKey GitGutterAdd
highlight default link WhichKeySeperator FoldColumn

" context.vim
let g:context_enabled = 0
let g:context_highlight_border = 'SpecialComment'

function! s:put_to_register(lines)
  let joined_lines = join(a:lines, '\n')
  if len(a:lines) > 1
    let joined_lines .= '\n'
  endif
  let @+ = joined_lines
endfunction

let g:nnn#action = {
      \ '<c-t>': 'tab split',
      \ '<c-s>': 'split',
      \ '<c-v>': 'vsplit',
      \ '<c-o>': function('<SID>put_to_register')
      \ }
