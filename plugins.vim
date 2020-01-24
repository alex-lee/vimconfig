" Specify a directory for plugins.
call plug#begin('~/.vim/plugged')

" tmux integration.
Plug 'christoomey/vim-tmux-navigator'

" Appearance.
Plug 'lifepillar/vim-solarized8'

" General behavior.
" Plug 'tpope/vim-unimpaired'

" Development tools.
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'janko/vim-test'
Plug 'vim-syntastic/syntastic'
" Plug 'dense-analysis/ale'

" Search.
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Syntax.
Plug 'cespare/vim-toml'
" Plug 'gabrielelana/vim-markdown'
Plug 'b4b4r07/vim-hcl'
Plug 'Glench/Vim-Jinja2-Syntax'

" Python
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'davidhalter/jedi-vim'

" Documentation
Plug 'vim-pandoc/vim-pandoc'

call plug#end()
