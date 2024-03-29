" Specify a directory for plugins.
if has('nvim')
    let s:plugins_dir = $HOME . '/.config/nvim/plugged-nvim'
else
    let s:plugins_dir = $HOME . '/.vim/plugged-vim'
endif

call plug#begin(s:plugins_dir)

" tmux integration.
Plug 'christoomey/vim-tmux-navigator'

" Appearance.
if has('nvim')
    Plug 'iCyMind/NeoSolarized'
    Plug 'rebelot/kanagawa.nvim'
    Plug 'nvim-lualine/lualine.nvim'
    Plug 'kyazdani42/nvim-web-devicons'
else
    Plug 'lifepillar/vim-solarized8'
    Plug 'itchyny/lightline.vim'
endif

" General behavior.
" Plug 'tpope/vim-unimpaired'

" Development tools.
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'vim-test/vim-test'

" Search.
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Syntax and formatting.
Plug 'osohq/polar.vim'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'prettier/vim-prettier'
if !has('nvim')
    " For nvim, rely on Treesitter.
    Plug 'cespare/vim-toml'
    Plug 'b4b4r07/vim-hcl'
endif

" Python
Plug 'Vimjas/vim-python-pep8-indent'

" TypeScript.
Plug 'HerringtonDarkholme/yats.vim'
Plug 'MaxMEllon/vim-jsx-pretty'

" Svelte.
Plug 'evanleck/vim-svelte', {'branch': 'main'}

" Go
Plug 'mattn/vim-goimports'

" Nix
Plug 'LnL7/vim-nix'

" Documentation
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'aklt/plantuml-syntax'

" Only use vim-lsp with vim. For neovim, use the builtin client.
if has('nvim')
    " Plugins for nvim-lsp.
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/nvim-compe'
    " Use this for python range formatting.
    Plug 'smbl64/vim-black-macchiato'
    " Support highlight colors.
    Plug 'folke/lsp-colors.nvim'
    " Use Treesitter.
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
else
    " vim-lsp and related plugins.
    Plug 'prabirshrestha/async.vim'
    Plug 'prabirshrestha/vim-lsp'
    Plug 'prabirshrestha/asyncomplete.vim'
    Plug 'prabirshrestha/asyncomplete-lsp.vim'
    Plug 'mattn/vim-lsp-settings'
endif

call plug#end()
