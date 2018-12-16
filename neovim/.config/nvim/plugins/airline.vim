let g:airline_mode_map = {
      \ '__' : '-',
      \ 'n'  : 'N',
      \ 'i'  : 'I',
      \ 'R'  : 'R',
      \ 'c'  : 'C',
      \ 'v'  : 'V',
      \ 'V'  : 'V',
      \ '' : 'V',
      \ 's'  : 'S',
      \ 'S'  : 'S',
      \ '' : 'S',
      \ }

let g:airline#extensions#wordcount#enabled = 0
let g:airline#extensions#whitespace#enabled = 0

let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
let g:airline#extensions#tabline#tabs_label = ''
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tabline#tab_min_count = 2
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#ale#enabled = 1

let g:airline_section_y = ''