call plug#begin('~/.vim/plugged')


" Tpope tools
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-rhubarb'



" Visuals
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'



" Programming Tools
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'w0rp/ale'
Plug 'SirVer/ultisnips'
Plug 'ervandew/supertab'
Plug 'craigemery/vim-autotag'
Plug 'sheerun/vim-polyglot'



" php
Plug 'tobyS/vmustache'
Plug 'tobyS/pdv'
Plug 'StanAngeloff/php.vim', { 'for': ['php', 'blade'] }
Plug 'arnaud-lb/vim-php-namespace', { 'for': ['php', 'blade'] }
Plug 'stephpy/vim-php-cs-fixer', { 'for': ['php', 'blade'] }
Plug 'jwalton512/vim-blade'



" rails & ruby
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'



" html
Plug 'mattn/emmet-vim'



" js & vue
Plug 'pangloss/vim-javascript'
Plug 'posva/vim-vue'
Plug 'mxw/vim-jsx'
Plug 'gcorne/vim-sass-lint'


" tmux
Plug 'christoomey/vim-tmux-navigator'
Plug 'jgdavey/tslime.vim'


call plug#end()
