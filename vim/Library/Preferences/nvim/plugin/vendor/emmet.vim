let g:user_emmet_mode='i'
let g:user_emmet_leader_key='<c-s>'

let g:user_emmet_settings = {
      \   'javascript.jsx': {
      \     'extends': 'jsx'
      \   },
      \   'typescript': {
      \     'extends': 'jsx'
      \   },
      \   'typescript.tsx': {
      \     'extends': 'jsx'
      \   }
      \ }

let g:user_emmet_install_global = 0
autocmd FileType html,css,sass,scss,javascript,jsx,vue,typescript.tsx,markdown EmmetInstall
