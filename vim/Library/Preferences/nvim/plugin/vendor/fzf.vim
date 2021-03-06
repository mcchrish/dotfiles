let $FZF_DEFAULT_OPTS="--color=16 --color='fg+:#eeeeee,bg+:#4e4e4e,hl:#00875f,hl+:#00875f,marker:#eeeeee,prompt:#767676,preview-fg:#808080' --layout=reverse"
let $FZF_PREVIEW_COMMAND="cat {}"
let g:fzf_command_prefix = 'Fzf'
let g:fzf_buffers_jump = 1
let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit'
      \ }
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'Debug' } }

command! -bang -nargs=* FzfRgAll call fzf#vim#grep(
      \ "rg --column --line-number --no-heading --color=always --smart-case --hidden ".shellescape(<q-args>),
      \ 1,
      \ fzf#vim#with_preview({ 'options': ['--color', 'hl:#00875f,hl+:#00875f'] }),
      \ <bang>0)
