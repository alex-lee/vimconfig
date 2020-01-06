" Specify a directory for plugins.
call plug#begin('~/.vim/plugged')

" tmux integration.
Plug 'christoomey/vim-tmux-navigator'

" Appearance.
Plug 'lifepillar/vim-solarized8'

" Tools.
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
" Plug 'tpope/vim-unimpaired'
Plug 'janko/vim-test'
Plug 'vim-syntastic/syntastic'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Syntax.
Plug 'cespare/vim-toml'
" Plug 'gabrielelana/vim-markdown'

" Python
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'davidhalter/jedi-vim'

call plug#end()
