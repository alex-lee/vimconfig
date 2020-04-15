setlocal colorcolumn=88,100

function! s:on_lsp_buffer_enabled() abort
    nmap <buffer> <leader>F :%!black-macchiato -l 100<CR>
    vmap <buffer> <leader>F :!black-macchiato -l 100<CR>
endfunction

augroup python_lsp_install
    autocmd!
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
