source $VIM_CONFIG_DIR/plugins/airline.vim
source $VIM_CONFIG_DIR/plugins/ale.vim
source $VIM_CONFIG_DIR/plugins/fzf.vim
source $VIM_CONFIG_DIR/plugins/nnn.vim
source $VIM_CONFIG_DIR/plugins/sneak.vim
source $VIM_CONFIG_DIR/plugins/ultisnips.vim

" deoplete
let g:deoplete#enable_at_startup = 1

" notational-fzf-vim
let g:nv_search_paths = ['~/Notes']
let g:nv_use_short_pathnames = 1
let g:nv_create_note_window = 'edit'
nnoremap <silent> <leader>nf :NV<cr>

" vim-fugitive
nnoremap <silent> <leader>gs :Gstatus<cr>
nnoremap <silent> <leader>gd :Gdiff<cr>
nnoremap <silent> <leader>gm :Gdiff develop<cr>
nnoremap <silent> <leader>gb :Gblame<cr>

" vim-qf
let g:qf_mapping_ack_style = 1
let g:qf_auto_open_quickfix = 1
let g:qf_auto_open_loclist = 1

nmap <F5> <Plug>qf_qf_toggle
nmap <F6> <Plug>qf_loc_toggle

runtime! plugin/unimpaired.vim
nmap <silent> [q <Plug>QfCprevious
nmap <silent> ]q <Plug>QfCnext
nmap <silent> [l <Plug>QfLprevious
nmap <silent> ]l <Plug>QfLnext

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
let g:goyo_width = 120

" goyo.vim
nnoremap <silent> <leader>- :Goyo<cr>
function! s:goyo_enter()
  if exists('$TMUX')
    silent !tmux set status off
  endif
endfunction

function! s:goyo_leave()
  if exists('$TMUX')
    silent !tmux set status on
  endif
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" vim-pencil
let g:pencil#wrapModeDefault = 'soft'

augroup pencil
  autocmd!
  autocmd FileType fountain,mardown call pencil#init()
  autocmd FileType fountain         setlocal showbreak=
augroup end

" vim-javascript
let g:javascript_plugin_flow = 1

" vim-jsx
let g:jsx_ext_required = 0

" emmet-vim
let g:user_emmet_mode='i'
let g:user_emmet_leader_key = '<c-s>'
let g:user_emmet_settings = {
      \   'javascript.jsx': {
      \     'quote_char': "'",
      \     'extends': 'jsx'
      \   }
      \ }

let g:user_emmet_install_global = 0
autocmd FileType html,ejs,css,sass,scss,less,javascript,jsx,eelixir EmmetInstall
