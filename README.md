Contents of current `.vimrc`:

```vim
let mapleader = ","

set ai
set ts=4
set sw=4
set tw=72
nnoremap <leader>q gqap
set nojoinspaces
inoremap jj <Esc>
set nofoldenable

" Pathogen load
filetype off
execute pathogen#infect()
execute pathogen#helptags()
filetype plugin indent on
syntax on

" Pymode settings
let g:pymode_options_max_line_length = 100
let g:pymode_folding = 0
let g:pymode_lint = 0
let g:pymode_rope_lookup_project = 1
let g:pymode_rope_show_doc_bind = '<leader>d'
let g:pymode_rope_goto_definition_bind = '<leader>g'

" Appearance
set background=dark
colorscheme solarized
```
	
Currently installed packages:

```
git clone git://github.com/altercation/vim-colors-solarized.git
git clone git://github.com/digitaltoad/vim-jade.git
git clone https://github.com/pangloss/vim-javascript.git
git clone https://github.com/plasticboy/vim-markdown.git
git clone https://github.com/klen/python-mode.git
```

