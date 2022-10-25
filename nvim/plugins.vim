call plug#begin('~/.config/nvim/plugged')

"--------------------- View & Edit ---------------------
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neovim/nvim-lspconfig'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'

Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips'
Plug 'preservim/nerdtree'
Plug 'mattn/emmet-vim'



"--------------------- Hashvim ---------------------
Plug 'hashivim/vim-terraform'

"--------------------- Language-Go ---------------------


"--------------------- Language-Ruby ---------------------
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-endwise'


"--------------------- Javascript & React ---------------------
Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }



"--------------------- Tmux ---------------------
Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-tmux-runner'

call plug#end()
