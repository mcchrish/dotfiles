let g:sneak#label      = 1
let g:sneak#use_ic_scs = 1

nmap ss <Plug>Sneak_s
xmap ss <Plug>Sneak_s

"replace 'f' with 1-char Sneak
nmap f <Plug>Sneak_f
nmap F <Plug>Sneak_F
xmap f <Plug>Sneak_f
xmap F <Plug>Sneak_F
omap f <Plug>Sneak_f
omap F <Plug>Sneak_F
"replace 't' with 1-char Sneak
nmap t <Plug>Sneak_t
nmap T <Plug>Sneak_T
xmap t <Plug>Sneak_t
xmap T <Plug>Sneak_T
omap t <Plug>Sneak_t
omap T <Plug>Sneak_T

nmap <expr> ; sneak#is_sneaking() ? '<Plug>Sneak_' : ':'
vmap <expr> ; sneak#is_sneaking() ? '<Plug>Sneak_' : ':'
