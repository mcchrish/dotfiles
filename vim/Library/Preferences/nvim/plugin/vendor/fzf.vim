let $FZF_DEFAULT_OPTS="--color=16 --color='fg+:#eeeeee,bg+:#4e4e4e,hl:#00875f,hl+:#00875f,marker:#eeeeee,prompt:#767676,preview-fg:#808080,border:#666666' --layout=reverse --bind=down:half-page-down,up:half-page-up"
let $FZF_PREVIEW_COMMAND="cat {}"
let g:fzf_buffers_jump = 1
let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit'
      \ }

command! -bang -nargs=* Rg call fzf#vim#grep(
      \ "rg --column --line-number --no-heading --color=always --smart-case -- ".shellescape(<q-args>),
      \ 1,
      \ fzf#vim#with_preview({ 'options': '--delimiter : --nth 4..' }),
      \ <bang>0)

command! -bang -nargs=* RgAll call fzf#vim#grep(
      \ "rg --column --line-number --no-heading --color=always --smart-case --hidden -- ".shellescape(<q-args>),
      \ 1,
      \ fzf#vim#with_preview({ 'options': '--delimiter : --nth 4.. --prompt="RgAll> "' }),
      \ <bang>0)
