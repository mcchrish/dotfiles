let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_enter = 1
let g:ale_warn_about_trailing_whitespace = 0
let g:ale_virtualtext_cursor = 1
let g:ale_set_signs = 0
let g:ale_lint_delay = 100

let g:ale_linters = {
      \ 'javascript': ['eslint', 'flow'],
      \}
let g:ale_javascript_eslint_options = '--cache'
let g:ale_javascript_prettier_options = '--single-quote --prose-wrap always'

let g:ale_fix_on_save = 1
let g:ale_fixers = {
      \ 'javascript': ['prettier'],
      \ 'typescript': ['prettier'],
      \ 'vue': ['prettier'],
      \ 'markdown': ['prettier'],
      \ 'css': ['prettier'],
      \ 'scss': ['prettier'],
      \ 'less': ['prettier'],
      \ 'yaml': ['prettier'],
      \ 'json': ['prettier'],
      \ 'html': ['prettier'],
      \ 'php': ['php-cs-fixer'],
      \ 'sh': ['shellcheck'],
      \ 'bash': ['shellcheck'],
      \ 'zsh': ['shellcheck']
      \}

let g:ale_sign_error = '✖'
let g:ale_sign_warning = '⚠'
let g:ale_statusline_format = ['✖ %d', '⚠ %d', '']

augroup load_ale_hi
  autocmd!
  autocmd VimEnter,ColorScheme * call extend_highlight#extend('Function', 'ALEVirtualTextError', { 'gui': ['italic'] })
      \| call extend_highlight#extend('TypeDef', 'ALEVirtualTextWarning', { 'gui': ['italic'] })
      \| call extend_highlight#extend('ErrorMsg', 'ALEError', { '+gui': ['italic'] })
      \| call extend_highlight#extend('ErrorMsg', 'ALEWarning', { '+gui': ['italic'] })
augroup END

nnoremap <silent> <leader>ef :ALEFix<cr>
