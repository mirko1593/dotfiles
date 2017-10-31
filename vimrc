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
set diffopt+=vertical                       " set Gdiff default split direction as vertical


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

""" search in Visual mode and use no-magic regexp
function! s:VSetSearch(cmdtype)
  let temp = @s
  norm! gv"sy
  let @/ = '\V' . substitute(escape(@s, a:cmdtype.'\'), '\n', '\\n', 'g')
  let @s = temp
endfunction

xnoremap * :<C-u>call <SID>VSetSearch('/')<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch('?')<CR>?<C-R>=@/<CR><CR>



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
set tabstop=2               "basic tab size
set shiftwidth=2            "shift width in normal mode
set softtabstop=2           "tab size in insert mode




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
silent! nunmap <leader>r
nmap <leader>r mrggVG=`r





"--------------------AutoCommands--------------------
autocmd FileType help nmap q :q<cr>
augroup basic
    autocmd!
    autocmd BufWritePost .vimrc so %
    autocmd BufWritePost ~/.vim/plugins.vim so $MYVIMRC
    autocmd BufWritePre * %s/\s\+$//e
    autocmd User fugitive
          \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
          \   nnoremap <buffer> .. :edit %:h<cr> |
          \ endif
    "automatically delete buffers of fugitives
    autocmd BufReadPost fugitive://* set bufhidden=delete
augroup END


augroup autoindent
    autocmd!
    autocmd FileType ruby,eruby,javascript,json,yaml,css setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType php setlocal ts=4 sts=4 sw=4 expandtab
augroup END

augroup ruby
  autocmd BufNewFile,BufRead Rakefile,Capfile,Gemfile,config.ru setfiletype ruby
augroup end

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

augroup frontend
    autocmd!
    autocmd FileType html,blade,vue,css,scss,javascript EmmetInstall
    autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.css
    autocmd BufRead,BufNewFile *.html setlocal filetype=html.javascript
    autocmd BufRead,BufNewFile *.babelrc setlocal filetype=json
    autocmd BufRead,BufNewFile *.jsx setlocal filetype=javascript.jsx
augroup END



"--------------------Plugins--------------------


""" Airline
let g:airline_theme='base16'



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


""" ALE
let g:airline#extensions#ale#enabled = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" Run linters only when entering or saving a file
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_save = 1

" Run fixers only when entering or saving a file
let g:ale_fix_on_save = 1

" show vim windows for the loclist items when exist errors/warnings
let g:ale_open_list = 1


let g:ale_linters = {
            \   'javascript': ['eslint'],
            \   'php': []
            \}


let g:ale_fixers = {
            \   'javascript': ['prettier_eslint'],
            \   'jsx': ['prettier_eslint']
            \}


let g:ale_javascript_prettier_eslint_options = '--single-quote
            \ --tab-width=2 --print-width=120'



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
nnoremap  <silent> <C-s> :w<cr>
inoremap <silent> <C-s> <ESC>:w<cr>

nmap <S-k> a<cr><ESC>





""" vim-easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)





""" Abolish
" 1> basic form, it resembles plain search
" 2> when specify a file or glob, it resembles ":vimgrep"
" 3> when a replacement field is specified, it behaves like
"    built-in ":substitute" command
" 4> ":Abolish" enhances vim's built-in ":iabbrev" command
"
" :S[ubvert]/pattern          : search in current buffer
" :S[ubvert]/pattern/ {file}...   :search in specified files, collecting
"                                  results in quickfix list.
" ps: check for "crc/crm/cs_/cru/cr-"
"
"
" :S[ubvert]/pattern/replacement/[flags]  :substitute in current buffer
" eg:
"   ":S/pumpkin/potato/g"   :will substitute "pumpkin/Pumpink/PUMPKIN"
"   ":S/pumpkin{,s}/potato{,es}/gc"   :substitute plural correctly
"   ":S/m{ouse,ice}/tracpad{,s}/gc"
"   ":S/insert_mode/replace_mode/gc"  :will also substitute
"                                     "InsertMode/ReplaceMode" as well.
"   ":S/{vim,tmux}/{tmux,vim}/g"      :swap two words
"
"
" ":Abolish {hon,col}our{,s,ed,ing} {}or{}"     :will generate 2*4*2 abbreviations
" ps: the last 2 is for 2 another format: Camel Case and UPPERCASE(Color/COLOR)





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
