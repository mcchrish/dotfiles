if $MINIMAL
  finish
endif

let g:UltiSnipsExpandTrigger       = "<tab>"
let g:UltiSnipsJumpForwardTrigger  = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

let g:UltiSnipsUsePythonVersion = 3

inoremap <silent> <tab> <c-r>=LoadUltiSnips()<cr>

" https://github.com/junegunn/vim-plug/wiki/tips#loading-plugins-manually
augroup load_us
  autocmd!
  autocmd InsertEnter * call plug#load('ultisnips')
        \| autocmd! load_us
augroup END
