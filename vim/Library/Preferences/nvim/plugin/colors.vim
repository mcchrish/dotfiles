" Colorscheme
set termguicolors
colorscheme yin

highlight link IndentBlanklineChar SpecialComment

highlight LspDiagnosticsDefaultHint guifg=#5f5fd7
highlight LspDiagnosticsFloatingHint guifg=#5f5fd7 guibg=#262626
highlight LspDiagnosticsUnderlineHint cterm=underline gui=underline guifg=#5f5fd7
highlight link LspDiagnosticsSignHint LspDiagnosticsFloatingHint

highlight LspDiagnosticsDefaultError guifg=#db4b4b
highlight LspDiagnosticsFloatingError guifg=#db4b4b guibg=#262626
highlight LspDiagnosticsUnderlineError cterm=underline gui=underline guifg=#db4b4b
highlight link LspDiagnosticsSignError LspDiagnosticsFloatingError

highlight LspDiagnosticsDefaultWarning guifg=#875f00
highlight LspDiagnosticsFloatingWarning guifg=#875f00 guibg=#262626
highlight LspDiagnosticsUnderlineWarning cterm=underline gui=underline guifg=#875f00
highlight link LspDiagnosticsSignWarning LspDiagnosticsFloatingWarning

highlight LspDiagnosticsDefaultInformation guifg=#87005f
highlight LspDiagnosticsFloatingInformation guifg=#87005f guibg=#262626
highlight LspDiagnosticsUnderlineInformation cterm=underline gui=underline guifg=#87005f
highlight link LspDiagnosticsSignInformation LspDiagnosticsFloatingInformation

highlight GitSignsAdd guifg=#00875f guibg=#262626
highlight GitSignsChange guifg=#005f87 guibg=#262626
highlight GitSignsDelete guifg=#870000 guibg=#262626

