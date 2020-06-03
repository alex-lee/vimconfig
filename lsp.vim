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
    nmap <buffer> <leader>F <plug>(lsp-document-format)
    vmap <buffer> <leader>F <plug>(lsp-document-range-format)
endfunction

augroup lsp_install
    autocmd!
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" Diagnostics.
let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1

" Colors.
highlight link LspHintText Todo

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

let g:lsp_settings = {}

" Use efm-langserver to augment certain filetypes.
let g:lsp_settings['efm-langserver'] = {
\   'disabled': v:false,
\   'whitelist': [
\       'json',
\       'python',
\       'rst',
\       'sh',
\       'yaml',
\   ],
\}

let g:lsp_settings_filetype_go = ['gopls', 'golangci-lint-langserver']
let g:lsp_settings['golangci-lint-langserver'] = {
\   'initialization_options': {
\       'command': ['golangci-lint', 'run', '--out-format', 'json'],
\   },
\}

let g:lsp_settings_filetype_typescript = ['typescript-language-server', 'eslint-language-server']
let g:lsp_settings_filetype_typescriptreact = ['typescript-language-server', 'eslint-language-server']

" Uncomment these for troubleshooting.
" let g:lsp_log_verbose = 1
" let g:lsp_log_file = expand('~/vim-lsp.log')
