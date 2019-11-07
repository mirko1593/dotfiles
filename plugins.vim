call plug#begin('~/.vim/plugged')


"--------------------- Tools ---------------------
Plug 'dense-analysis/ale'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'SirVer/ultisnips'
Plug 'ervandew/supertab'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'mattn/emmet-vim'
Plug 'tomtom/tcomment_vim'
Plug 'mirko1593/vim-autotag'

"--------------------- VISUALS ---------------------
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'



"--------------------- PHP ---------------------
Plug 'StanAngeloff/php.vim', { 'for': ['php', 'blade'] }
Plug 'arnaud-lb/vim-php-namespace', { 'for': ['php'] }


"--------------------- Javascript && Vue ---------------------
Plug 'pangloss/vim-javascript'
Plug 'posva/vim-vue'

"--------------------- Tmux ---------------------
Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-tmux-runner'

call plug#end()
