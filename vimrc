"--------------------Basic--------------------
set nocompatible
filetype plugin indent on

so ~/.vim/plugins.vim




"--------------------- BASIC SETTING ---------------------

let mapleader = ","
syntax on
set noeb vb t_vb=
set backspace=indent,eol,start
set noshowmode

set hidden
" Automatically write buffer back to file
" set autowriteall
" Automatically read updated file to buffer
set autoread

set complete=.,w,b,u
set completeopt-=preview
set cpoptions+=d

" Set "./" relative to current directory, not current file
set tags+=./tags.laravel


"set shellcmdflag+=i

" Collect swapfile to a specific directory
set directory=$HOME/.vim/swapfiles//

set timeout
set timeoutlen=300
set ttimeoutlen=0

" Use y/p to yank/paste content from system clipboard in Vim
set clipboard=unnamed


set relativenumber
set numberwidth=2
set ruler
set laststatus=2
set scrolloff=2
set history=50





"--------------------- Searching ---------------------
set incsearch
set hlsearch
set ignorecase
set smartcase


" Visual mode and use no-magic regexp
function! s:VSetSearch(cmdtype)
    let temp = @s
    norm! gv"sy
    let @/ = '\V' . substitute(escape(@s, a:cmdtype.'\'), '\n', '\\n', 'g')
    let @s = temp
endfunction

xnoremap * :<C-u>call <SID>VSetSearch('/')<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch('?')<CR>?<C-R>=@/<CR><CR>



"--------------------- SPLIT ---------------------

set splitbelow
" ps. vsp is default to splitleft, set splitright if needed.

" nnoremap <C-J> <C-w><C-J>
" nnoremap <C-K> <C-W><C-K>
" nnoremap <C-H> <C-W><C-H>
" nnoremap <C-L> <C-W><C-L>

" :wincmd <Bar><cr> Fullscreen current split
" :wincmd =<cr>     Equal split current screen
" :wincmd is <C-w>
nnoremap <C-O> :wincmd o<cr>

" automatically rebalance tmux windows on vim resize
autocmd VimResized * :wincmd =


" Set Gdiff default split direction as vertical
" set diffopt+=vertical





"--------------------- VISUAL ---------------------
set background=dark
" Ensure terminal app is using a base16 terminal theme.
" and download colorscheme from the right repository:
" https://github.com/martinlindhe/base16-iterm2
colorscheme base16-google-light


" swap iTerm2 cursors in vim insert mode when using tmux
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_SR = "\<Esc>]50;CursorShape=2\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif



"--------------------- INDENTATION ---------------------

" Only when (noexpandtab) && (!shiftwidth || !softtabstop),
" tabstop is used to convert "#spaces" to a tab
set autoindent
set expandtab
set tabstop=4               "basic tab size
set softtabstop=4           "tab size in insert mode
set shiftwidth=4            "shift width in normal mode





"--------------------- BASIC MAPPING ---------------------

nmap <leader>ev :tabedit $MYVIMRC<cr>
nmap <leader>ep :split ~/.vim/plugins.vim<cr>
nmap <leader>et :split ~/.tmux.conf<cr>

nmap <leader><space> :nohlsearch<cr>


nnoremap <S-b> :b

nmap <leader>f :tag<space>

" ctags will read config file ~/.ctags
nmap <leader>rt :!ctags -R -f tags<cr>

" re-generate tags for laravel source code
nmap <leader>lt :!ctags -R -f tags.laravel vendor/laravel<cr>

"edit file in current director
nmap <leader>e :e <C-R>=escape(expand("%:p:h"),' ') . '/'<cr>


command! Q q            " bind :Q to :q
command! W w
command! Qa qall

" Go up and down wrapped lines
nmap k gk
nmap j gj

nnoremap qq :bufdo bd!<cr>:q<cr>

" re-indentation and back to current position
silent! nunmap <leader>r
nmap <leader>r mrggVG=`r





"--------------------- BASCI AUTOCMDS ---------------------

autocmd FileType help nmap q :q<cr>
augroup autosourcing
    autocmd!
    autocmd BufWritePost .vimrc so %
    autocmd BufWritePost ~/.vim/plugins.vim so $MYVIMRC
augroup END



augroup ruby
    autocmd!
    autocmd FileType ruby,eruby,yaml setlocal ts=2 sts=2 sw=2 expandtab
    autocmd BufNewFile,BufRead Rakefile,Capfile,Gemfile,config.ru set filetype=ruby
augroup end

augroup laravel
    autocmd!
    " autocmd BufNewFile,BufRead * if match(getline(1),"blade") >= 0 | set filetype=javascript | endif

augroup end





"--------------------- PLUGINS ---------------------

"\
            "\ ALE
"\
let g:ale_linters_explicit = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let g:ale_echo_msg_format = '[%linter%] reports: [%s]'
let g:airline#extensions#ale#enabled = 1
" Run linters only when entering or saving a file
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_filetype_changed = 0
let g:ale_lint_on_enter = 0
" show errors in quickfix instead of loclist.
let g:ale_set_loclist = 1
let g:ale_set_quickfix = 0
" show vim windows for the loclist items when exist errors/warnings
let g:ale_open_list = 1
" hide loclist or quckfix after errors are fixed.
let g:ale_keep_list_window_open = 0


"\
            "\ ALE Linters
"\

" These are by default.
let g:ale_lint_on_save = 1
" Run both javascript and vue linter for vue files.
let g:ale_linters_aliases = { 'vue': ['vue', 'javascript'] }
let g:vue_pre_processors = []

let g:ale_linters = {
            \   'php': ['php'],
            \   'javascript': ['eslint'],
            \   'vue': ['eslint'],
            \   'go': ['golint']
            \ }
let g:ale_javascript_eslint_suppress_eslintignore = 1


"\
            "\ ALE Fixers
"\

let g:ale_fix_on_save = 1

let g:ale_fixers = {
            \   '*': ['remove_trailing_lines', 'trim_whitespace'],
            \   'javascript': ['prettier'],
            \   'vue': ['prettier'],
            \   'php': ['php_cs_fixer'],
            \   'go': ['gofmt']
            \ }
let g:ale_php_cs_fixer_options = '--rules=@PSR2,@PHP73Migration'
let g:ale_php_cs_fixer_use_global = 1






"\
            "\ FZF && fzf.vim
"\
nnoremap <C-p> :Files<cr>
inoremap <C-p> <ESC>:Files<cr>

" Since fzf.vim use --sort=yes as default for buffer_tags
" Only way to preserve order is to update source code of:
" ~/.vim/plugged/fzf.vim/autoload/fzf/vim.vim
nnoremap <C-e> :BTags<cr>
inoremap <C-e> <ESC>:BTags<cr>

nnoremap <c-f> :Buffers<cr>
inoremap <c-f> <ESC>:Buffers<cr>





"\
            "\ NERDTree
"\
nmap <C-b> :NERDTreeToggle<cr>

let NERDTreeHijackNetrw = 0
let NERDTreeShowHidden = 1
let g:NERDTreeMapJumpPrevSibling=""
let g:NERDTreeMapJumpNextSibling=""

" Open NERDTree automatically when vim starts with no
" arguments. eg: "vim" or "vim ."
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif





"\
            "\ vim-fugitive
"\

augroup fugitive
    autocmd!
    autocmd BufWritePre * %s/\s\+$//e
    autocmd User fugitive
                \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
                \   nnoremap <buffer> .. :edit %:h<cr> |
                \ endif
    "Jump up to the commit object for the current tree by press "C"
    "automatically delete buffers of fugitives
    autocmd BufReadPost fugitive://* set bufhidden=delete
augroup END

" set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
" set statusline=%{fugitive#statusline()}





"\
            "\ UltiSnips
"\
let g:UltiSnipsSnippetsDir=$HOME."/.vim/UltiSnips"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"



"\
            "\ vim-surround && vim-commentary
"\
augroup surround
    autocmd!
    autocmd FileType php let b:surround_45 = "<?php \r ?>"
    autocmd FileType php let b:surround_61 = "<?= \r ?>"
    autocmd FileType blade let b:surround_61 = "{{ \r }}"
    autocmd FileType ruby let g:surround_45 = "<% \r %>"
    autocmd FileType ruby let g:surround_61 = "<%= \r %>"
augroup END

augroup commentary
    autocmd!
    autocmd FileType php setlocal commentstring=#\ %s
    autocmd FileType blade setlocal commentstring={{--\ %s\ --}}
augroup END






"\
            "\ Emmet
"\
" disable suspend in vim for use of emmet
let g:user_emmet_leader_key = ','
let g:user_emmet_mode = "i"
augroup emmet
    autocmd!
    autocmd FileType html,vue,blade,css EmmetInstall
augroup END






"\
            "\ Airline
"\
let g:airline_theme='base16'
"let g:airline#extensions#tabline#fnamemod = ':p:.'





"\
            "\ php-namespace
"\
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction

function! IPhpExpandClass()
    call PhpExpandClass()
    call feedkeys('a', 'n')
endfunction

augroup phpnamespace
    autocmd!
    autocmd FileType php inoremap <Leader>n <Esc>:call IPhpInsertUse()<CR>
    autocmd FileType php noremap <Leader>n :call PhpInsertUse()<CR>
    autocmd FileType php inoremap <Leader>a <Esc>:call IPhpExpandClass()<CR>
    autocmd FileType php noremap <Leader>a :call PhpExpandClass()<CR>
augroup END

" sort uses by length instead of alphabetically.
vmap <leader>su ! awk '{ print length(), $0 \| "sort -n \| cut -d\\  -f2-" }'<cr>





"\
            "\ Vue
"\
let g:vue_disable_pre_processors = 1





"\
            "\ autotag
"\
let g:autotagTagsFile="tags"
" let g:autotagCtagsCmd="ctags -Rf tags"
let g:autotagStopAt=".git"
let g:autotagExcludeSuffixes="blade"



"\
            "\ vim-go
"\
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1



" before this map works, need to disable iterm interrupt <c-s>
" already put some setting in ~/.zshrc
nnoremap  <silent> <C-s> :w<cr>
inoremap <silent> <C-s> <ESC>:w<cr>

nmap <S-k> a<cr><ESC>








"-----------------Find-and-Replace---------------
" vimgrep
"   :vimgrep is Vim’s built-in command for searching
"    across multiple files
" vim[grep][!] /{pattern}/[g][j] {file}...
"   :search for {pattern} in the files {file}... and update
"    quickfix list with matches
" g: add every match
" j: not jump to first match, only update quickfix list
"
"
""" Project-wide find and replace
" 1> populating the arglist with ":args" command
"     eg: args: `ag -g . app/`
" 2> find matches across arglist with ":vimgrep"
"     eg: vimgrep /Vimcast\.\zscom/g ##
"     "##" denotes filenames in arglist
" 3> replace with substitute command
"     eg: cdo %s/Vimcasts\.\zscom/org/ge
" 4> write back to file
"     eg: cdo update
" ps: ":update" only ":write" when buffer has been modified
"
"
""" ps: ":lvim[grep]" and ":ldo" update "location list",
"       which is similar to "quickfix list" but accociated
"       with a window not whole vim.
