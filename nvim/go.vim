lua <<EOF
 function go_org_imports(wait_ms)
    local params = vim.lsp.util.make_range_params()
    params.context = {only = {"source.organizeImports"}}
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, wait_ms)
    for cid, res in pairs(result or {}) do
      for _, r in pairs(res.result or {}) do
        if r.edit then
          local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
          vim.lsp.util.apply_workspace_edit(r.edit, enc)
        end
      end
    end
    vim.lsp.buf.formatting()
  end
EOF


lua <<EOF
    require'lspconfig'.gopls.setup{}
EOF

augroup go
    au!
    autocmd FileType go nnoremap <leader>rt :!ctags -R .<cr>
    autocmd FileType go setlocal omnifunc=v:lua.vim.lsp.omnifunc
    autocmd BufWritePre *.go lua go_org_imports()
    autocmd BufWritePre *.go :Dispatch! ctags %
    autocmd BufRead,BufNewFile,BufWritePost *.proto setfiletype proto
    autocmd FileType proto setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType go setlocal makeprg=revive
    autocmd BufWritePost *.go silent make! % | silent redraw!
    autocmd QuickFixCmdPost [^l]* cwindow
augroup END
