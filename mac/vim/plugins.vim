call plug#begin('~/.vim/plugged')

"--------------------- View & Edit ---------------------
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips'
Plug 'preservim/nerdtree'
Plug 'dense-analysis/ale'
Plug 'prabirshrestha/vim-lsp'

"--------------------- Language-Go ---------------------
" Plug 'govim/govim'

"--------------------- Tmux ---------------------
Plug 'christoomey/vim-tmux-navigator'

call plug#end()
