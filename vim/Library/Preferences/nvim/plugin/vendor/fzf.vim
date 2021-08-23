let g:fzf_buffers_jump = 1
let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit'
      \ }
let g:fzf_colors = { 'border':  ['fg', 'FloatBorder'] }

let rg_flags = "--column --line-number --no-heading --color=always --smart-case --colors=path:fg:black"

command! -bang -nargs=* Rg call fzf#vim#grep(
      \ "rg ".rg_flags." -- ".shellescape(<q-args>),
      \ 1,
      \ fzf#vim#with_preview({ 'options': '--delimiter : --nth 4..' }),
      \ <bang>0)

command! -bang -nargs=* RgAll call fzf#vim#grep(
      \ "rg ".rg_flags." --hidden -- ".shellescape(<q-args>),
      \ 1,
      \ fzf#vim#with_preview({ 'options': '--delimiter : --nth 4.. --prompt="RgAll> "' }),
      \ <bang>0)
