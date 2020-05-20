" vim-which-key
let g:which_key_map = {}
call which_key#register('<Space>', "g:which_key_map")
nnoremap <silent> <leader> :<c-u>WhichKey '<space>'<cr>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<space>'<cr>

" Move vertically by visual line
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap gj j
nnoremap gk k

" Move visual block
vnoremap J :m '>+1<cr>gv=gv
vnoremap K :m '<-2<cr>gv=gv

" Reselect indent in visual mode
vnoremap < <gv
vnoremap > >gv

" More scroll
nnoremap <c-y> 4<c-y>
nnoremap <c-e> 4<c-e>

" Easy reindenting
nnoremap g= gg=Gg``

" Remap esc
" inoremap jk <esc>
imap jk <Plug>(PearTreeFinishExpansion)

" Move in insert mode
inoremap <c-h> <c-o>h
inoremap <c-l> <c-o>a
inoremap <c-j> <c-o>j
inoremap <c-k> <c-o>k
inoremap <c-^> <c-o><C-^>

" No ex mode
nnoremap Q <nop>

" Fix mistypes when quiting
cabbrev Wq wq
cabbrev W w
cabbrev Q q

" Faster save
let g:which_key_map.w = 'Save file'
nnoremap <silent> <leader>w :silent update<cr>

" Delete without overwriting default register
nnoremap vd "_d
xnoremap vd "_d
nnoremap x  "_x
xnoremap x  "_x
nnoremap vD "_D

" Actual Y
nnoremap Y y$

" Clipboard
" vnoremap <leader>d "+d
" vnoremap <leader>y "+y
" vnoremap <leader>p "+p
" vnoremap <leader>P "+P
" nnoremap <leader>d "+d
" nnoremap <leader>y "+y
" nnoremap <leader>p "+p
" nnoremap <leader>P "+P

" Repeat substitution with flag
nnoremap & :&&<CR>
vnoremap & :&&<CR>

" Repeat macro over all selected lines
vnoremap @ :norm@

nnoremap <c-]> g<c-]>

" Paste mode
set pastetoggle=<F2>

" Select just insert text
nnoremap gV `[V`]

" Window navigation
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

nnoremap <tab>   <c-w>w
nnoremap <S-tab> <c-w>W

" Terminal
tnoremap <esc> <c-\><c-n>
tnoremap <c-h> <c-\><c-n><c-w>h
tnoremap <c-j> <c-\><c-n><c-w>j
tnoremap <c-k> <c-\><c-n><c-w>k
tnoremap <c-l> <c-\><c-n><c-w>l

autocmd BufWinEnter,WinEnter * if &buftype == 'terminal' | startinsert | endif
autocmd BufLeave * if &buftype == 'terminal' | stopinsert | endif

let g:which_key_map['<CR>'] = 'Refresh'
nnoremap <silent> <leader><cr> :call my#refresh()<cr>

" tcomment_vim
nnoremap <silent> gcc :TComment<cr>
vnoremap <silent> gc :TComment<cr>

" vim-fugitive
let g:which_key_map.g = { 'name': '+Git' }
let g:which_key_map.g.s = 'status'
let g:which_key_map.g.d = 'diff'
let g:which_key_map.g.m = 'messenger'
let g:which_key_map.g.b = 'blame'
let g:which_key_map.g.l = 'log'
nnoremap <silent> <leader>gs :G<cr>
nnoremap <silent> <leader>gd :Gdiff<cr>
nnoremap <silent> <leader>gb :Gblame<cr>
nnoremap <silent> <leader>gl :Flog<cr>

" splitjoin.vim
nnoremap gss :SplitjoinSplit<cr>
nnoremap gsj :SplitjoinJoin<cr>

" undotree
let g:which_key_map.u = 'Undotree'
nnoremap <silent> <leader>u :UndotreeToggle<cr>

" vim-signature
let g:which_key_map["'"] = 'Signature signs'
nnoremap <silent> <leader>' :SignatureToggleSigns<cr>

" vim-sandwich
nmap s <Nop>
xmap s <Nop>

" vim-gitgutter
let g:which_key_map.g.g = 'gutter'
let g:which_key_map.g.h = 'gutter highlights'
let g:which_key_map.h = { 'name': '+Git hunk' }
let g:which_key_map.h.p = 'preview'
let g:which_key_map.h.s = 'stage'
let g:which_key_map.h.u = 'undo'
nnoremap <silent> <leader>gg :GitGutterToggle<cr>
nnoremap <silent> <leader>gh :GitGutterLineHighlightsToggle<cr>

" vista.vim
let g:which_key_map.s = { 'name': '+Vista' }
let g:which_key_map.s.s = 'vista'
let g:which_key_map.s.f = 'finder'
nnoremap <silent> <leader>ss :Vista!!<cr>
nnoremap <silent> <leader>sf :Vista finder fzf<cr>

" Fzf
" Search current word under cursor
function! SearchWordWithRg()
  execute 'FzfRg' expand('<cword>')
endfunction

" Search visual selected
function! SearchVisualSelectionWithRg() range
  let old_reg = getreg('"')
  let old_regtype = getregtype('"')
  let old_clipboard = &clipboard
  set clipboard&
  normal! ""gvy
  let selection = getreg('"')
  call setreg('"', old_reg, old_regtype)
  let &clipboard = old_clipboard
  execute 'FzfRg' selection
endfunction

let g:which_key_map.A = 'rg all'
let g:which_key_map.a = 'rg'
let g:which_key_map.f = 'files'
let g:which_key_map.d = 'files (current file directory)'
let g:which_key_map.b = 'buffer'
let g:which_key_map.l = 'buffer lines'
let g:which_key_map.L = 'buffer lines (all loaded)'
let g:which_key_map.m = 'marks'
let g:which_key_map.K = 'rg word under cursor'
nnoremap <silent> <leader>A :FzfRgAll<cr>
nnoremap <silent> <leader>a :FzfRg<cr>
nnoremap <silent> <leader>f :FzfFiles<cr>
nnoremap <silent> <leader>d :FzfFiles <c-r>=expand("%:h")<cr>/<cr>
nnoremap <silent> <leader>b :FzfBuffers<cr>
nnoremap <silent> <leader>l :FzfBLines<cr>
nnoremap <silent> <leader>L :FzfLines<cr>
nnoremap <silent> <leader>m :FzfMarks<cr>
nnoremap <silent> <leader>K :call SearchWordWithRg()<cr>
vnoremap <silent> <leader>K :call SearchVisualSelectionWithRg()<cr>

" Mapping selecting mappings
let g:which_key_map['<TAB>'] = 'normal mode mapping'
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Goyo
let g:which_key_map['-'] = 'Goyo'
nnoremap <silent> <leader>- :Goyo<cr>

" nnn.vim
function! s:put_to_register(lines)
  let joined_lines = join(a:lines, '\n')
  if len(a:lines) > 1
    let joined_lines .= '\n'
  endif
  echom joined_lines
  let @+ = joined_lines
endfunction

function! s:nnn(...)
  let l:dir = get(a:, 1, '')
  let l:opts = get(a:, 2, { 'edit': 'edit' })
  let l:keypress = get(a:, 3, '')
  call nnn#pick(l:dir, l:opts)
  if strlen(l:keypress) > 0
    call feedkeys(l:keypress)
  endif
endfunction

let g:which_key_map.n = { 'name': '+nnn' }
let g:which_key_map.n.n = { 'name': 'open' }
let g:which_key_map.n.c = { 'name': 'open on current file directory' }
let g:which_key_map.n.t = { 'name': 'write to register on select' }
nnoremap <silent> <leader>nn :call <SID>nnn()<CR>
nnoremap <silent> <leader>nc :call <SID>nnn(expand('%:h'))<CR>
nnoremap <silent> <leader>nt :call <SID>nnn('', { 'edit': function('<SID>put_to_register') })<CR>

autocmd! FileType nnn tnoremap <buffer> <esc> q

" COC
let g:which_key_map.c = { 'name': '+COC' }

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Symbol renaming.
let g:which_key_map.c.r = 'rename'
nmap <leader>cr <Plug>(coc-rename)

let g:which_key_map.c.o = 'outline'
nnoremap <silent> <leader>co  :<c-u>CocList outline<cr>

let g:which_key_map.c.o = 'outline'
nnoremap <silent> <leader>co  :<c-u>CocList outline<cr>

let g:which_key_map.c.a = 'action'
xmap <leader>ca <plug>(coc-codeaction-selected)
nmap <leader>ca <plug>(coc-codeaction-selected)

let g:which_key_map.c.c = 'command'
let g:which_key_map.c.d = 'diagnostics'
let g:which_key_map.c.s = 'snippets'
nnoremap <leader>cc :CocCommand<cr>
nnoremap <leader>cd :CocList diagnostics<cr>
nnoremap <leader>cs :CocList snippets<cr>

nnoremap <silent> K :call <SID>show_documentation()<cr>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Use <c-l> for trigger snippet expand.
imap <c-l> <plug>(coc-snippets-expand)

" Use <c-j> for select text for visual placeholder of snippet.
vmap <c-j> <plug>(coc-snippets-select)

" Use <c-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <c-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <c-j> for both expand and jump (make expand higher priority.)
imap <c-j> <plug>(coc-snippets-expand-jump)

" context.vim
let g:which_key_map.t = 'context'
nnoremap <leader>t :ContextToggle<cr>

" info-window.nvim
nnoremap <silent> <c-g> :InfoWindowToggle<cr>
