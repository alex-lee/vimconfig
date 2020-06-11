" For vim8, clone to ~/.vim and symlink this file to ~/.vimrc
" For neovim, clone to ~/.config/nvim

if has('nvim')
    let s:base_dir = $HOME . '/.config/nvim'

    " Set explicit python paths.
    " These should be virtualenvs set up for neovim.
    " If not set, you will encounter problems when working in other virtualenvs.
    " https://github.com/zchee/deoplete-jedi/wiki/Setting-up-Python-for-Neovim
    let g:python_host_prog = $HOME . '/.pyenv/versions/neovim2/bin/python'
    let g:python3_host_prog = $HOME . '/.pyenv/versions/neovim3/bin/python'
else
    let s:base_dir = $HOME . '/.vim'

    set nocompatible
    filetype plugin indent on
    syntax on
endif

" Load plugins.
let s:plugins_config = s:base_dir . '/plugins.vim'
if filereadable(s:plugins_config)
    exec 'source ' . s:base_dir . '/plugins.vim'
endif

" Colors and theme.
set background=dark
if exists('+termguicolors') && has('nvim')
    set termguicolors
    colorscheme NeoSolarized
elseif exists('+termguicolors') && !has('nvim')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
    colorscheme solarized8
endif

" Status line.
let s:statusline_config = s:base_dir . '/statusline.vim'
if filereadable(s:statusline_config)
    exec 'source ' . s:statusline_config
endif

" General behavior.
if !has('nvim')
    set autoindent
    set backspace=indent,eol,start
    set hlsearch        " Highlight matches
    set incsearch       " Incremental search
    set modeline        " Enable modeline for per-file vim settings
    set showcmd         " Show (partial) command in status line.
    set ttymouse=sgr
endif

set mouse=a         " Enable mouse usage (all modes).
set nofoldenable    " Disable folding.
set nojoinspaces    " Don't add extra spaces when joining lines.
set number
set showmatch       " Show matching brackets.

set scrolloff=4     " Show some context at top and bottom of window.
set sidescroll=1    " Make horizontal scrolling less jumpy
set sidescrolloff=4 " Show some horizontal context at sides of window

set ignorecase      " Do case insensitive matching
set smartcase       " Do smart case matching

set shiftwidth=4
set tabstop=4
set textwidth=100

let mapleader = ','

" Improved window splitting.
" For navigation, install https://github.com/christoomey/vim-tmux-navigator
set splitbelow
set splitright

" File browser (netrw).
let g:netrw_list_hide='.*\.swp,.*\.pyc'
nnoremap <leader>E :Explore<CR>

" Load vim-lsp settings.
let s:lsp_config = s:base_dir . '/lsp.vim'
if filereadable(s:lsp_config)
    exec 'source ' . s:lsp_config
endif

" Other mappings.
let s:input_config = s:base_dir . '/input.vim'
if filereadable(s:input_config)
    exec 'source ' . s:input_config
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

" Fugitive shortcuts.
nnoremap <leader>Gb :Gblame<CR>

" Additional custom mappings:
" reformat the paragraph
nnoremap Q gqap
" easier than hitting escape
inoremap jj <Esc>
" close the buffer, but don't close the window (instead load previous)
command! BD bp|bd #
" highlight <cword>, but don't automatically jump to the next match.
nnoremap <silent> <leader>* :<C-u>let @/ = '\<' . expand('<cword>') . '\>'<CR>:set hlsearch<CR>
nnoremap <silent> <leader>g* :<C-u>let @/ = expand('<cword>')<CR>:set hlsearch<CR>
" clear highlight.
nnoremap <silent> <leader>n :nohlsearch<CR>
" clear signs.
nmap <leader>L :sign unplace *<CR>

" vim.test
nnoremap <leader>tn :TestNearest<CR>
nnoremap <leader>tf :TestFile<CR>
nnoremap <leader>ts :TestSuite<CR>
nnoremap <leader>tl :TestLast<CR>
nnoremap <leader>tg :TestVisit<CR>

" Markdown (plasticboy) settings
let g:vim_markdown_folding_disabled = 1

" vim-pandoc
let g:pandoc#spell#enabled = 0
let g:pandoc#formatting#mode = 'h'
let g:pandoc#formatting#textwidth = 100
let g:pandoc#syntax#conceal#use = 0
let g:pandoc#biblio#sources = "bgy"
