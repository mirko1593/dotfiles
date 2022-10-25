set nocompatible
filetype plugin indent on
syntax on
language en_US.UTF-8
let mapleader=","

"mouse move laziness
set timeout
set timeoutlen=300
set ttimeoutlen=0
set noeb vb t_vb=
" set backspace = indent,eol,start               " backspace on indent,eof,start of line
" set scrolloff = 8
" set history   = 50
" set t_CO      = 256
set number
set relativenumber
set numberwidth=4
set noshowmode
set hidden                                     " unsaved modification to buffer behind
                                               " windonw.
set autoread                                   " automatic read updated file
set autowrite                                  " automatic write back to file(unnessary)


"autcomplete
set complete=.,w,b,u
set completeopt-=preview
set cpoptions+=d
                                               " set clipboard=unnamed
                                               " sync with system clipboard
" set directory = $HOME/.config/nvim/swapfiles// " save swapfiles in one place
set splitbelow                                 " default horizontal split direction up
set splitright                                 " default vertical split to left


"status bar
set ruler
set laststatus=2
set signcolumn=no

"indentation
set autoindent
set expandtab
set tabstop=4                                  " basic tab size
set softtabstop=4                              " tab size in insert mode
set shiftwidth=4                               " shift width in normal mode

map j gj
map k gk
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"search
set incsearch
set hlsearch
set ignorecase
set smartcase
nmap <leader><space> :nohlsearch<cr>
function! s:VSetSearch(cmdtype)
    let temp = @s
    norm! gv"sy
    let @/ = '\V' . substitute(escape(@s, a:cmdtype.'\'), '\n', '\\n', 'g')
    let @s = temp
endfunction

"visual mode and use no-magic regexp
xnoremap * :<C-u>call <SID>VSetSearch('/')<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch('?')<CR>?<C-R>=@/<CR><CR>

"visual
set background=dark
" Ensure terminal app is using a base16 terminal theme.
" and download colorscheme from the right repository:
" https://github.com/martinlindhe/base16-iterm2
colorscheme base16-google-light

hi LineNr ctermbg=bg ctermfg=gray
" set foldcolumn=2
hi foldcolumn ctermbg=bg
hi vertsplit ctermbg=bg ctermfg=bg
hi CursorLine ctermbg=gray ctermfg=bg



" SAVE
" before this map works, need to disable iterm interrupt <c-s>
" already put some setting in ~/.zshrc
nnoremap  <silent> <C-s> :w<cr>
inoremap <silent> <C-s> <ESC>:w<cr>

nmap <leader>ev :e $MYVIMRC<cr>
nmap <leader>eb :e ~/.config/nvim/basic.vim<cr>
nmap <leader>ep :split ~/.vim/plugins.vim<cr>
nmap <leader>et :split ~/.tmux.conf<cr>

"<S-J> join lines
nmap <S-k> a<cr><ESC>

"EDIT
nmap <leader>e :e <C-R>=escape(expand("%:p:h"),' ') . '/'<cr>

vnoremap <leader>v "_dP
nnoremap <space> za

command! -nargs=+ -complete=file_in_path Gr execute 'silent grep! <args>' | copen | silent redraw!

augroup BASIC
    au!
    au FileType help nmap <buffer> q :q<cr>
    au BufLeave help unmap q
	au BufWritePost basic.vim so %
    au VimResized * :wincmd =
    "au FileType netrw nnoremap Q :q<cr>
    " reset cursor on start:
    autocmd VimEnter * silent !echo -ne "\e[2 q"
    " cursor blinking bar on insert mode
    let &t_SI = "\e[1 q"
    " cursor steady block on command mode
    let &t_EI = "\e[2 q"
    " turn on/off line hi when enter/leave insert mode
    "autocmd InsertEnter,InsertLeave * set cul!
augroup END


"================ Plugins Settings ====================
"emmet-vim
let g:user_emmet_install_global = 0
let g:user_emmet_leader_key=','

"fzf
nnoremap <C-p> :Files<CR>
nnoremap <C-f> :BTags<CR>
nnoremap <c-e> :Buffers<CR>

"easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

"ultisnips
let g:UltiSnipsSnippetsDir=$HOME."/.vim/UltiSnips"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

"supertab
inoremap <expr> <c-j> ((pumvisible())?("\<C-n>"):("j"))
inoremap <expr> <c-k> ((pumvisible())?("\<C-p>"):("k"))

"nerdtree
nmap <C-b> :NERDTreeToggle<cr>
let NERDTreeHijackNetrw = 0
let NERDTreeShowHidden = 1
let g:NERDTreeMapJumpPrevSibling=""
let g:NERDTreeMapJumpNextSibling=""
let g:netrw_dirhistmax = 0

augroup PLUGIN
    au!
    "fugitive
    " 'a' key to toggle between the git show and git ls-tree views.
    " 'C' key to jump up to the commit object for the current tre
    autocmd BufReadPost fugitive:///* set bufhidden=delete
    autocmd User fugitive nnoremap <buffer> .. :edit %:h<CR>

    " Open NERDTree automatically when vim starts with no
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
augroup END

