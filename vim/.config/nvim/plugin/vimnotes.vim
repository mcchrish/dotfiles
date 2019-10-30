if $VIMNOTES != 1
  finish
endif

set background=light
let g:airline_theme='snow_light'
set statusline=%#StatusLineNC#\ %t%m%=%w%q\ %p%%\ %l/%L\ ㏑\ :\ %v\ 

" set columns=80
highlight link NonText LineNr

" autocmd BufEnter,BufWritePost *.md call my#preview_markdown("%:p", v:false)

function! s:open_latest_file()
  let l:latest_file = trim(system('ls -pt '.$NOTES_DIR.'/ | grep -v / | head -1'))
  execute 'silent' 'edit' fnameescape(expand($NOTES_DIR.'/'.l:latest_file))
  set filetype=markdown
  silent NERDTree
endfunction
autocmd VimEnter * call s:open_latest_file()

" notational-fzf-vim
let g:nv_search_paths = [$NOTES_DIR]
let g:nv_use_short_pathnames = 1
let g:nv_create_note_window = 'edit'
let g:nv_keymap = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit'
      \ }
nnoremap <silent> <leader>n :NV<cr>
nnoremap <silent> <leader>s :call my#save_file_to_notes()<cr>
nnoremap <silent> <leader>p :call my#preview_markdown("%:p", v:true)<cr>

" NERDTree
let g:NERDTreeMinimalUI = 1
let g:NERDTreeMinimalMenu = 1
let g:NERDTreeSortOrder = ['[[-timestamp]]']
