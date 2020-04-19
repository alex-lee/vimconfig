" Specify a directory for plugins.
call plug#begin('~/.vim/plugged')

" tmux integration.
Plug 'christoomey/vim-tmux-navigator'

" Appearance.
Plug 'lifepillar/vim-solarized8'
Plug 'itchyny/lightline.vim'

" General behavior.
" Plug 'tpope/vim-unimpaired'

" Development tools.
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'janko/vim-test'

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

" Documentation
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'

" LSP
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'mattn/vim-lsp-settings'

call plug#end()
