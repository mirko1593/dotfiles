call plug#begin('~/.vim/plugged')


Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'bling/vim-bufferline'
Plug 'vim-syntastic/syntastic'



Plug 'tpope/vim-vinegar'
Plug 'scrooloose/nerdtree'
Plug 'rking/ag.vim'
Plug 'skwp/greplace.vim'
Plug 'ervandew/supertab'
Plug 'craigemery/vim-autotag'
Plug 'SirVer/ultisnips'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'


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
Plug 'posva/vim-vue'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

" tmux
Plug 'christoomey/vim-tmux-navigator'
Plug 'jgdavey/tslime.vim'


call plug#end()
