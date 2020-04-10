" Custom statusline.
"
" Expects the following plugins:
"   itchyny/lightline.vim

set laststatus=2
set noshowmode

" Show relative paths
let g:lightline = {
\   'colorscheme': 'solarized',
\   'component_function': {
\       'filename': 'LightlineFilename'
\   },
\ }

function! LightlineFilename()
    return expand('%:~:.')
endfunction
