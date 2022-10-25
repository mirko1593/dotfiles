augroup RUBY
    au!
    autocmd FileType ruby nnoremap <leader>rt :!ctags -R .<cr>
    autocmd BufWritePre *.rb :Dispatch! ctags %
    autocmd BufRead *.erb set filetype=eruby.html.ruby
    autocmd FileType ruby,eruby,yaml setlocal ts=2 sts=2 sw=2 expandtab
    autocmd BufWritePre *.rb silent :Dispatch! rubocop -x -f q %

    autocmd FileType ruby let rubycomplete_buffer_loading = 1
    autocmd FileType ruby let rubycomplete_classes_in_global = 1
    autocmd FileType ruby let rubycomplete_rails = 1
    autocmd FileType ruby let rubycomplete_load_gemfile = 1
    autocmd FileType eruby EmmetInstall
    "vim-surround
    autocmd FileType eruby let g:surround_45 = "<% \r %>"
    autocmd FileType eruby let g:surround_61 = "<%= \r %>"
augroup END
