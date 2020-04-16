" Configuration for vim-lsp.
"
" Expects the following plugins:
"   prabirshrestha/async.vim
"   prabirshrestha/vim-lsp
"   prabirshrestha/asyncomplete.vim
"   prabirshrestha/asyncomplete-lsp.vim
"   mattn/vim-lsp-settings

" Custom mappings.

function! s:on_lsp_buffer_enabled() abort
    setlocal signcolumn=yes

    " diagnostics
    nmap <buffer> gA <plug>(lsp-document-diagnostics)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)

    " navigate
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gy <plug>(lsp-type-definition)
    nmap <buffer> gr <plug>(lsp-references)

    " info
    nmap <buffer> K <plug>(lsp-hover)
    nmap <buffer> <silent> <leader>pc <plug>(lsp-preview-close)

    " format (varies by filetype)
    if &filetype ==# 'json'
        nmap <buffer> <leader>F :%LspDocumentRangeFormat<CR>
        vmap <buffer> <leader>F <plug>(lsp-document-range-format)
    elseif &filetype ==# 'python'
        nmap <buffer> <leader>F :%!black-macchiato -l 100<CR>
        vmap <buffer> <leader>F :!black-macchiato -l 100<CR>
    else
        nmap <buffer> <leader>F <plug>(lsp-document-format)
        vmap <buffer> <leader>F <plug>(lsp-document-range-format)
    endif
endfunction

augroup lsp_install
    autocmd!
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" Diagnostics.
let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1

" Autocomplete.
let g:asyncomplete_popup_delay = 200
imap <C-Space> <Plug>(asyncomplete_force_refresh)
" use tab and shift-tab to select
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" make the popup go away after selection
inoremap <expr> <C-y>   pumvisible() ? asyncomplete#close_popup() : "\<C-y>"
inoremap <expr> <CR>    pumvisible() ? asyncomplete#close_popup() : "\<CR>"
" auto close preview window when selection is done
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" Python settings.
" Install any necessary programs into the vim-lsp-settings venv, e.g.:
"   $ ~/.local/share/vim-lsp-settings/servers/pyls/venv/bin/pip install flake8 mypy pyls_mypy future
" (For some reason I had to manually install the future package.)
let g:lsp_settings = {
\   'pyls': {
\       'workspace_config': {
\           'pyls': {
\               'configurationSources': ['flake8'],
\               'plugins': {
\                   'pyflakes': {'enabled': v:false},
\                   'flake8': {'enabled': v:true},
\                   'pyls_mypy': {
\                       'enabled': v:true,
\                       'live_mode': v:false,
\                   },
\               },
\           },
\       },
\   },
\}

" Uncomment these for troubleshooting.
" let g:lsp_log_verbose = 1
" let g:lsp_log_file = expand('~/vim-lsp.log')
