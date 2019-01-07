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

