if $MINIMAL
  finish
endif

let g:user_emmet_mode='i'
let g:user_emmet_leader_key = '<c-s>'
let g:user_emmet_settings = {
      \   'javascript.jsx': {
      \     'quote_char': "'",
      \     'extends': 'jsx'
      \   }
      \ }

let g:user_emmet_install_global = 0
autocmd FileType html,ejs,css,sass,scss,less,javascript,jsx,eelixir,markdown,vue EmmetInstall
