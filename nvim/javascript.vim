augroup JAVASCRIPT
    au!
    autocmd FileType javascript set filetype=javascript.jsx
    autocmd FileType html setlocal commentstring=//\ %s
    autocmd FileType html,css,jsx,javascript EmmetInstall
    autocmd FileType javascript,jsx nnoremap <leader>rt :!ctags -R .<cr>
    autocmd BufWritePre *.js,*.jsx :Dispatch! ctags %
    autocmd FileType javascript,jsx setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType css,scss let b:prettier_exec_cmd = "prettier-stylelint"
    autocmd BufWritePre *.js,*.jsx PrettierAsync
    autocmd FileType *.js,*.jsx setlocal 
                \ makeprg=./node_modules/eslint/bin/eslint.js
    autocmd FileType javascript,jsx nnoremap <leader>c :Make! %<cr>
    " autocmd BufWritePost *.js,*.jsx Make! % 
    autocmd FileType javascript,jsx nnoremap <leader>cc :lclose<cr>
augroup END
