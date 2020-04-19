" Set explicit python paths.
" These should be virtualenvs set up for neovim.
" If not set, you will encounter problems when working in other virtualenvs.
" https://github.com/zchee/deoplete-jedi/wiki/Setting-up-Python-for-Neovim
let g:python_host_prog = $HOME . '/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = $HOME . '/.pyenv/versions/neovim3/bin/python'

" Load plugins.
if filereadable(expand('~/.config/nvim/plugins.vim'))
    source ~/.config/nvim/plugins.vim
endif

" Appearance.
set background=dark
if exists('+termguicolors')
    set termguicolors
endif
colorscheme NeoSolarized

set number

" Status line.
if filereadable(expand('~/.vim/statusline.vim'))
    source ~/.vim/statusline.vim
endif

" General behavior.
set mouse=a         " Enable mouse usage (all modes).
set scrolloff=4     " Show some context at top and bottom of window.
set tabstop=4
set shiftwidth=4
set textwidth=100
set nojoinspaces    " Don't add extra spaces when joining lines.
set nofoldenable    " Disable folding.

let mapleader = ','

" File browser (netrw).
nnoremap <leader>E :Explore<CR>

" Load vim-lsp settings.
if filereadable(expand('~/.vim/statusline.vim'))
    source ~/.vim/lsp.vim
endif

" Quickfix navigation.
nnoremap <C-n> :cnext<CR>
nnoremap <C-p> :cprevious<CR>
nnoremap <leader>cc :cclose<CR>
nnoremap <leader>lc :lclose<CR>

" Location navigation.
nmap <silent> [l :lprevious<CR>
nmap <silent> ]l :lnext<CR>

" fzf shortcuts.
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fb :Buffers<CR>
nnoremap <leader>fl :BLines<CR>
nnoremap <leader>fL :Lines<CR>
nnoremap <leader>ft :BTags<CR>
nnoremap <leader>fT :Tags<CR>
nnoremap <leader>rr :Rg<Space>

" Markdown settings.
let g:markdown_enable_spell_checking = 0

" Custom mappings:
" reformat the paragraph
nnoremap Q gqap
" easier than hitting escape
inoremap jj <Esc>
" close the buffer, but don't close the window (instead load previous)
command BD bp|bd #

" Improved window splitting.
" For navigation, install https://github.com/christoomey/vim-tmux-navigator
set splitbelow
set splitright

" vim.test
nnoremap <leader>tn :TestNearest<CR>
nnoremap <leader>tf :TestFile<CR>
nnoremap <leader>ts :TestSuite<CR>
nnoremap <leader>tl :TestLast<CR>
nnoremap <leader>tg :TestVisit<CR>

" Syntastic settings.
" Only use this for certain file types. See, e.g., after/ftplugin/sh.vim.
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_mode_map = {'mode': 'passive'}
let g:syntastic_python_checkers = []

" Clear signs (e.g. linter marks from syntastic, pymode, etc.)
nmap <leader>L :sign unplace *<CR>

" Markdown (plasticboy) settings
let g:vim_markdown_folding_disabled = 1

" vim-pandoc
let g:pandoc#spell#enabled = 0
let g:pandoc#formatting#mode = 'h'
let g:pandoc#formatting#textwidth = 100
let g:pandoc#syntax#conceal#use = 0
