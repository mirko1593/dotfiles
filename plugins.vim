call plug#begin('~/.vim/plugged')


" Tpope tools
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-vinegar'



" Visuals
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'bling/vim-bufferline'
Plug 'scrooloose/nerdtree'



" Programming Tools
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'w0rp/ale'
Plug 'SirVer/ultisnips'
Plug 'ervandew/supertab'
Plug 'rking/ag.vim'
Plug 'skwp/greplace.vim'
Plug 'craigemery/vim-autotag'



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
