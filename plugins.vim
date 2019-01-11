call plug#begin('~/.vim/plugged')





"--------------------- Tools ---------------------
Plug 'w0rp/ale'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'SirVer/ultisnips'
Plug 'ervandew/supertab'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'mirko1593/vim-autotag'
Plug 'sheerun/vim-polyglot'
Plug 'mattn/emmet-vim'



"--------------------- VISUALS ---------------------
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'


"--------------------- PHP ---------------------
Plug 'StanAngeloff/php.vim', { 'for': ['php', 'blade'] }
Plug 'arnaud-lb/vim-php-namespace', { 'for': ['php', 'blade'] }
Plug 'jwalton512/vim-blade'



"--------------------- RUBY & RAILS ---------------------
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'



"--------------------- Javascript ---------------------
Plug 'pangloss/vim-javascript'



"--------------------- Vue ---------------------
Plug 'posva/vim-vue'



"--------------------- Tmux ---------------------
Plug 'christoomey/vim-tmux-navigator'
Plug 'jgdavey/tslime.vim'





call plug#end()
