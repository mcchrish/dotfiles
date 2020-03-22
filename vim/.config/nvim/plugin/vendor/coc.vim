" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

highlight CocErrorSign guifg=#870000 guibg=#262626
highlight CocWarningSign guifg=#875f00 guibg=#262626
highlight CocInfoSign guifg=#87005f guibg=#262626
highlight CocHintSign guifg=#5f5fd7 guibg=#262626

highlight link CocFloating LineNr
