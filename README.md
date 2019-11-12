# Vim setup notes

Clone this repository into `~/.vim` and use `vimrc.home` as your
`~/.vimrc`:
```
ln -s ~/.vim/vimrc.home ~/.vimrc
```

## Installing Vim 8

*This config now expects vim 8. For older versions you can still use
pathogen.vim for plugin management, if you'd like.*

Instructions for Ubuntu 16.04:
```
sudo add-apt-repository ppa:jonathonf/vim
sudo apt update
sudo apt install vim
```

## Python support

For simple linting I use `flake8`, via Syntastic.

```
pip3 install --user flake8
```

Example config:

```
$ cat ~/.config/flake8
[flake8]
max_line_length = 100
```

[mypy](http://mypy.readthedocs.io/en/latest/index.html) is configured to be run
with `--ignore-missing-imports` by default. It may make sense to configure
behavior on a per-project basis, for example by putting the following in
`setup.cfg`:

```
[mypy]
ignore_missing_imports = True
implicit_reexport = True
namespace_packages = True
```

## Packages

Clone whichever ones you want into `~/.vim/pack/plugins/start`.

```
# tmux integration and easier window navigation
git clone git@github.com:christoomey/vim-tmux-navigator.git

# Nice colors.
git clone git@github.com:lifepillar/vim-solarized8.git

# Helpful tools.
git clone https://github.com/mileszs/ack.vim.git
git clone --depth=1 https://github.com/vim-syntastic/syntastic.git
git clone https://github.com/tpope/vim-unimpaired.git
git clone https://github.com/janko/vim-test.git

# Additional tools.
git clone https://github.com/majutsushi/tagbar.git
git clone https://github.com/tpope/vim-fugitive.git
git clone https://github.com/editorconfig/editorconfig-vim.git

# Python.
git clone --recursive https://github.com/davidhalter/jedi-vim.git
git clone https://github.com/Vimjas/vim-python-pep8-indent.git

# Additional syntax highlighting.
git clone https://github.com/plasticboy/vim-markdown.git
git clone https://github.com/cespare/vim-toml.git toml
```

These are less likely to be of interest.

```
git clone https://github.com/sukima/xmledit.git
git clone git://github.com/digitaltoad/vim-jade.git

# Additional syntax highlighting.
git clone https://github.com/eloycoto/vim-ser.git
git clone https://github.com/b4b4r07/vim-hcl.git
git clone https://github.com/nathanielc/vim-tickscript.git
```

For the following, [neovim](https://neovim.io/) is actually preferred. See
[neovimconfig](https://github.com/alex-lee/neovimconfig).

```
# Go.
git clone https://github.com/myitcv/govim.git

# Elm.
git clone https://github.com/Zaptic/elm-vim.git

# Javascript/TypeScript.
git clone https://github.com/pangloss/vim-javascript.git
git clone https://github.com/leafgarland/typescript-vim.git
git clone https://github.com/Quramy/tsuquyomi.git
```
