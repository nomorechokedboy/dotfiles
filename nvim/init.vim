syntax on
set termguicolors
colorscheme one_monokai
let g:one_monokai_no_bg = 1
hi Normal ctermbg=none guibg=none
hi SignColumn ctermbg=none guibg=none
hi NormalNC ctermbg=none guibg=none
hi MsgArea ctermbg=none guibg=none
hi TelescopeBorder ctermbg=none guibg=none
hi NvimTreeNormal ctermbg=none guibg=none
hi LineNr ctermbg=None guibg=None guifg=#9254d9
let &fcs='eob: '

lua require('init')

