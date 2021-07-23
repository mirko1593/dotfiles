call plug#begin('~/.vim/plugged')

"--------------------- View & Edit ---------------------
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'

Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips'

"--------------------- Language-Go ---------------------
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

"--------------------- Tmux ---------------------
Plug 'christoomey/vim-tmux-navigator'

call plug#end()
