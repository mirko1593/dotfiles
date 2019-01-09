" Disable print key for macvim
if has("gui_macvim")
    macmenu &File.Print key=<nop>
endif

set linespace=14

set guifont=Operator_Mono_XLight:h14

set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R

hi vertsplit guifg=bg guibg=bg
