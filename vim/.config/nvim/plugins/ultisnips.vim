let g:UltiSnipsExpandTrigger       = "<tab>"
let g:UltiSnipsJumpForwardTrigger  = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

let g:UltiSnipsUsePythonVersion = 3

inoremap <silent> <tab> <c-r>=LoadUltiSnips()<cr>

function! s:loadDeopleteConfigs()
  let l:default_sources = ['around', 'buffer', 'file', 'member']
  call deoplete#custom#option('sources', {
        \  '_': default_sources,
        \  'markdown': default_sources + ['dictionary'],
        \  'fountain': default_sources + ['dictionary'],
        \  'text': default_sources + ['dictionary']
        \ })
  call deoplete#custom#source('dictionary', 'rank', 600)
endfunction

" https://github.com/junegunn/vim-plug/wiki/tips#loading-plugins-manually
augroup load_us_deopl
  autocmd!
  autocmd InsertEnter * call plug#load('ultisnips', 'deoplete.nvim')
        \| call <SID>loadDeopleteConfigs()
        \| autocmd! load_us_deopl
augroup END
