let g:UltiSnipsExpandTrigger       = "<tab>"
let g:UltiSnipsJumpForwardTrigger  = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

let g:UltiSnipsUsePythonVersion = 3

inoremap <silent> <tab> <C-r>=LoadUltiSnips()<cr>

" https://github.com/junegunn/vim-plug/wiki/tips#loading-plugins-manually
augroup load_us_deopl
  autocmd!
  autocmd InsertEnter * call plug#load('ultisnips', 'deoplete.nvim')
                     \| autocmd! load_us_deopl
augroup END
