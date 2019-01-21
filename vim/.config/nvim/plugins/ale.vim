let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 1
let g:ale_warn_about_trailing_whitespace = 0
let g:ale_virtualtext_cursor = 1

let g:ale_linters = {
      \ 'javascript': ['eslint', 'flow'],
      \}
let g:ale_javascript_eslint_options = '--cache'
let g:ale_javascript_prettier_options = '--single-quote --prose-wrap always'

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

nnoremap <silent> <leader>ef :ALEFix<cr>