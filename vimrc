"--------------------Basic--------------------
set nocompatible
filetype plugin indent on

so ~/.vim/plugins.vim

set backspace=indent,eol,start
set noeb vb t_vb=
syntax on
set hidden
set complete=.,w,b,u
set completeopt-=preview
set cpoptions+=d
set tags+=./tags.laravel                    " set "./" relative to current directory, not current file
set autoread                                " automatically read updated file to buffer
"set shellcmdflag+=i
set directory=$HOME/.vim/swapfiles//        " put swapfile to a specific directory
set timeout
set timeoutlen=300
set ttimeoutlen=0
set clipboard=unnamed                       " use y/p to yank/paste content from system clipboard in Vim


let mapleader = ","

set relativenumber
set ruler
set laststatus=2
set scrolloff=2

set history=50
set showcmd

" neckbeard
let ruby_space_errors = 1
let c_space_errors = 1



""" Search Config
set incsearch
set hlsearch
set ignorecase                              "case insensitive pattern matching
set smartcase                               "overrides ignorecase if pattern contains upcase


""" Split
set splitbelow
set splitright

nnoremap <C-J> <C-w><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-L> <C-W><C-L>

nnoremap <C-\> :wincmd <Bar><cr>
nnoremap <C-_> :wincmd =<cr>
nnoremap <C-O> :wincmd o<cr>

" automatically rebalance tmux windows on vim resize
autocmd VimResized * :wincmd =



"--------------------Visual--------------------
set background=light
if filereadable(expand("~/.vimrc_background"))
    let base16colorspace=256
    source ~/.vimrc_background
endif

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

" if !has('gui_macvim') && filereadable(expand("~/.vimrc_background"))
"     let base16colorspace=256
"     source ~/.vimrc_background
" endif

set t_CO=256
set linespace=14
set numberwidth=2
set guifont=Operator_Mono_XLight:h14

set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R

hi vertsplit guifg=bg guibg=bg



"--------------------Indentation--------------------
"""
""" Only when (noexpandtab) && (!shiftwidth || !softtabstop),
""" tabstop is used to convert "#spaces" to a tab
set autoindent
set expandtab
set tabstop=4               "basic tab size
set shiftwidth=4            "shift width in normal mode
set softtabstop=4           "tab size in insert mode




"--------------------BasicMapping--------------------
nmap <leader>ev :tabedit $MYVIMRC<cr>
nmap <leader>ep :split ~/.vim/plugins.vim<cr>
nmap <leader>et :split ~/.tmux.conf<cr>

nmap <leader><space> :nohlsearch<cr>

nmap <leader>f :tag<space>
" ctags will read config file ~/.ctags
nmap <leader>rt :!ctags -Rftags<cr>
" generate tags for laravel source code
nmap <leader>lt :!ctags -R -f tags.laravel vendor/laravel<cr>

"edit file in current director
nmap <leader>e :e <C-R>=escape(expand("%:p:h"),' ') . '/'<cr>

" disable suspend in vim for use of emmet
noremap <c-z> <nop>

command! Q q            " bind :Q to :q
command! W w        
command! Qa qall

" make reasonable linewise move
nmap k gk
nmap j gj

nnoremap qq :bufdo bd!<cr>:q<cr>

" re-indentation and back to current position
silent! nunmap <C-r>
nmap <C-r> mrggVG=`r





"--------------------AutoCommands--------------------
autocmd FileType help nmap q :q<cr>
augroup basic
    autocmd!
    autocmd BufWritePost .vimrc so %
    autocmd BufWritePost ~/.vim/plugins.vim so $MYVIMRC
augroup END


augroup autoindent
    autocmd!
    autocmd FileType ruby,eruby,javascript,json setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType javascript.html setlocal ts=4 sts=4 sw=4 expandtab
augroup END


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
"--------------------Plugins--------------------


""" Airline
let g:airline_theme='base16'


""" Bufferline
"denotes whether bufferline should automatically echo to the command bar
let g:bufferline_echo = 0
"scrolling with fixed current buffer position
let g:bufferline_rotate = 1
"current buffer always first
let g:bufferline_fixed_index = 0



""" Vinegar
"Press . on a file to pre-populate it at the end of a : command line
"Press ! on a file starts the line off with a bang
"Press d to create a new directory
"Press % to create a new file
"press D to delete current item
"press R to rename current item



""" NERDTreeToggle
nmap <C-b> :NERDTreeToggle<cr>

let NERDTreeHijackNetrw = 0
let NERDTreeShowHidden = 1

"open NERDTree automatically when vim starts with no 
"arguments. eg: "vim" or "vim ."
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif






""" Ag
" : used by FZF
let g:ag_prg="ag --vimgrep --line-numbers --noheading"
let g:ag_working_path_mode="r"
" Usage: 
" :Ag [options] {pattern} [{directory}]
"
" Shortcuts:
" e    to open file and close the quickfix window
" o    to open (same as enter)
" go   to preview file (open but maintain focus on ag.vim results)
" t    to open in new tab
" T    to open in new tab silently
" h    to open in horizontal split
" H    to open in horizontal split silently
" v    to open in vertical split
" gv   to open in vertical split silently
" q    to close the quickfix window




""" Greplace
set grepprg=ag\ --ignore\ *tags*
let g:grep_cmd_opts = '--line-numbers --ignore vendor --ignore node_modules --noheading'
" Usage:
" 1> use :Gsearch to get a buffer window of search results
" 2> make replacement in buffer window using traditional tool: s/foo/bar
" 3> invoke :Greplace to make changes across all files.
" 4> save changes to all files :wa




""" PDV - PHP Documentor for Vim
let g:pdv_template_dir = $HOME ."/.vim/plugged/pdv/templates_snip"
nnoremap <leader>d :call pdv#DocumentWithSnip()<CR>



""" UltiSnips
let g:UltiSnipsSnippetsDir=$HOME."/.vim/UltiSnips"
"let g:UltiSnipsSnippetDirectories=["UltiSnips"]
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"



""" php-namespaces

function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction

function! IPhpExpandClass()
    call PhpExpandClass()
    call feedkeys('a', 'n')
endfunction

augroup namespace
    autocmd!
    autocmd FileType php inoremap <Leader>n <Esc>:call IPhpInsertUse()<CR>
    autocmd FileType php noremap <Leader>n :call PhpInsertUse()<CR>
    autocmd FileType php inoremap <Leader>nf <Esc>:call IPhpExpandClass()<CR>
    autocmd FileType php noremap <Leader>nf :call PhpExpandClass()<CR>
augroup END

" autocmd FileType php inoremap <Leader>s <Esc>:call PhpSortUse()<CR>
" autocmd FileType php noremap <Leader>s :call PhpSortUse()<CR>

" let g:php_namespace_sort_after_insert = 1

vmap <leader>su ! awk '{ print length(), $0 \| "sort -n \| cut -d\\  -f2-" }'<cr>



"" autotag
let g:autotagTagsFile="tags"
let g:autotagCtagsCmd="ctags -Rftags"


""" php-cs-fixer
nnoremap <silent><leader>rf :call PhpCsFixerFixFile()<CR>
" nnoremap <silent><leader>pcd :call PhpCsFixerFixDirectory()<CR>
let g:php_cs_fixer_rules = "@PSR2"




""" syntastic
" set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"let g:syntastic_php_checkers = ["php", "phpcs", "phpmd"]
let g:syntastic_php_checkers = ["php", "phpmd"]
let g:syntastic_html_checkers = ['tidy']
let g:syntastic_scss_scss_lint_exec = "/usr/local/bin/sass-lint"
let g:syntastic_scss_checkers = ['sass_lint']
let g:syntastic_sass_checkers = ['sass-lint']
let g:syntastic_javascript_checkers = ['eslint']



""" vim-jsx
"enable jsx syntax highlighting in js files
let g:jsx_ext_required = 0              



""" tslime.vim
" send a selection in visual mode to tmux
vmap <leader>t <Plug>SendSelectionToTmux
" grab the current method that a cursor is in normal mode
nmap <leader>m <Plug>NormalModeSendToTmux
" reset the session, window, and pane info
" run tmux command in vim command line
" nmap <leader>.. :Tmux <Tmux-Command><cr>
" always use the current session and current window
let g:tslime_always_current_session = 1
let g:tslime_always_current_window = 1



""" emmet-vim
" let g:user_emmet_mode='n'    "only enable normal mode functions.
" let g:user_emmet_mode='inv'  "enable all functions, which is equal to
" let g:user_emmet_mode='a'    "enable all function in all mode.
let g:user_emmet_install_global = 0

let g:user_emmet_leader_key=','
" let g:user_emmet_expandabbr_key = '<tab>'
" let g:user_emmet_complete_tag = 1
let g:user_emmet_next_key = '<c-z>n'
let g:user_emmet_settings = {
            \ 'php' : {
            \   'extends' : 'html', 
            \   'filters' : 'c',
            \ },
            \ 'blade' : {
            \   'extends' : 'html',
            \ },
            \ 'vue'   : {
            \   'extends' : 'html',
            \ },
\ }

""" Vue
let g:vue_disable_pre_processors = 1

augroup frontend
    autocmd!
    autocmd FileType html,blade,vue,css,scss,javascript EmmetInstall
    autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.css
    autocmd BufRead,BufNewFile *.html setlocal filetype=javascript.html
    autocmd BufRead,BufNewFile *.babelrc setlocal filetype=json
augroup END



""" FZF
nnoremap <C-p> :Files<cr>
inoremap <C-p> <ESC>:Files<cr>

nnoremap <C-e> :BTags<cr>
inoremap <C-e> <ESC>:BTags<cr>

nnoremap <c-f> :Buffers<cr>
inoremap <c-f> <ESC>:Buffers<cr>

nnoremap <S-b> :b

" before this map works, need to disable iterm interrupt <c-s>
" already put some setting in ~/.zshrc
nnoremap <C-s> :w<cr>
inoremap <C-s> <ESC>:w<cr>


"--------------------Concepts--------------------
"""Tags
" A tag is an identifier that appears in a "tag" file
" which has to be generated by a program like ctags.
"
" On the tag stack is remembered which tags you jumped to,
" and from where.
"
"
" 1> Operations on Tag Stack:
" :tags - Show the content of the tag stack, the active entry
"         is marked with a '>'
" Ctrl-T : Same to [1]pop
" :[count]pop - Jump to [count] older/up entry in tag stack
" :[count]tag - Jump to [count] newer/down entry in tag stack
" ps: pop/tag will not "truely" pop the "tag stack"
"
"
" 2> Operations on "tags" file:
" Ctrl-] : same to ":tag {ident}"
" :tag {ident} - Jump to the definition of {ident}, and put
"               {ident} in the tag stack"
" ps: so an easy way back if "Ctrl-T", which is jump back 
"     to older entry in "tag stack"
"
"
" 3> Operations on matching-list:
" :ts [ident]  -   List tags match [ident], using infomation 
"                  in the tags file.
"                  When [ident] is not given, the last tag name 
"                  from tag stack is used.
" :sts [ident] -   Does ":ts [ident]" and splits the window for 
"                  the selected tag
" g]           -   Like "Ctrl-]", but use ":ts" instead of ":tag"
"                  ie: use "matching-list"
" :tj [ident]  -   Like ":ts", but jump to the tag directly when 
"              -   there is only one match.
" :sts [ident] -   Does ":tj" and splits the window for selected tag
" g Ctrl-]     -   Like "Ctrl-]", but use ":tj" instead of ":tag"
" [count]tn, tN, tp, tr/tf, tl
" 
" The tag match list can also be used in the preview window. The 
" commands are the same as above, with a "p" prepended.
" pts, ptj, ptn, ptN, ptp, ptr, ptf
"
" Key-mapping provided by "tpope/un-impaired"
nnoremap <silent> ]t :tn<cr>
nnoremap <silent> [t :tp<cr>
nnoremap <silent> ]T :tl<cr>
nnoremap <silent> [T :tf<cr>





""" Marks
"
" m{a-z}  : set mark {a-z} at cursor position, which is 
"           valid only in current buffer.
" m{A-Z}  : set mark {A-Z} at cursor position, which is
"           valid across all files.
" Jump to a mark can be done in two ways:
" '       : the cursor is positioned on the first non-blank
"           character of the line.
" `       : the cursor is positioned at the specified loaction.
"
"
""" Registers
"
" There are ten types of registers in vim:
" 1. The unnamed register ""
" 2. 10 numbered registers "0 to "9
" 3. The small delete register "-
" 4. 26 named registers "a to "z or "A to "Z
" 5. three read-only registers ":, "., "%
" 6. alternate buffer register "#
" 7. the expression register "=
" 8. The selection and drop registers "*, "+ and "~ 
" 9. The black hole register "_
" 10. Last search pattern register "/
"
" ops about register:
" "{register-name}y  : yield to named-register
" "{register-name}p  : paste content from named-register
" Ctrl-r + {register-name}  : paste content from named-register in 
"                           : insert mode.
" :reg {register-name}  : see all/{register-name} registers and their contens
"
" ps: every time vim perform [d, c, s, x] or y, text will be placed in a
" default register, which can be accessed through "", that what vim uses 
" to paste: p <=> ""p
"
""" numbered registers:
" "0  : always have the content of the latest yank
" "1~"9  : last 9 deleted text
"
""" named registered: a-zA-Z
" 1: Vim fills these registers only when you say so.
" 2: Specify as lowercase to replace previous content
" 3: Specify as uppercase to append to previous content
"
""" blackhole register: "_
" 1: when writing to this register, nothing happens. 
" 2: when read from this register, nothing returns
" 3: this can be used to delete text without affecting the 
"    normal register
