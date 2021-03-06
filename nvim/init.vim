syntax on
set termguicolors
colorscheme onedarker
" hi Normal ctermbg=none guibg=none
" hi SignColumn ctermbg=none guibg=none
" hi NormalNC ctermbg=none guibg=none
" hi MsgArea ctermbg=none guibg=none
" hi TelescopeBorder ctermbg=none guibg=none
" hi NvimTreeNormal ctermbg=none guibg=none
" let &fcs='eob: '
" hi LineNr guifg=#9254d9
" hi LineNr guifg=#00A3EE
" hi LineNr guifg=#0093EA
hi LineNr guifg=#00D4FF

lua require('init')

highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080
" blue
highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6
highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6
" light blue
highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
highlight! CmpItemKindInterface guibg=NONE guifg=#9CDCFE
highlight! CmpItemKindText guibg=NONE guifg=#9CDCFE
" pink
highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0
highlight! CmpItemKindMethod guibg=NONE guifg=#C586C0
" front
highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
highlight! CmpItemKindProperty guibg=NONE guifg=#D4D4D4
highlight! CmpItemKindUnit guibg=NONE guifg=#D4D4D4
