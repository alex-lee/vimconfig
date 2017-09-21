# Vim setup notes

Clone this repository into `~/.vim` and use `vimrc.home` as your
`~/.vimrc`:
```
ln -s ~/.vim/vimrc.home ~/.vimrc
```

## Installing Vim 8

Instructions for Ubuntu 16.04:
```
sudo add-apt-repository ppa:jonathonf/vim
sudo apt update
sudo apt install vim
```

## Autocompletion

I'm now trying out
[YouCompleteMe](https://github.com/Valloric/YouCompleteMe). For my needs
the only additional support that I enable is for Go.
```
sudo apt install build-essential cmake  # build dependencies
cd ~/.vim/bundle
git clone https://github.com/Valloric/YouCompleteMe.git
cd YouCompleteMe
git submodule update --init --recursive
python3.5 ./install.py --gocode-completer  # force use of system python3
```

## Packages

Clone whichever ones you want into `~/.vim/bundle`.
```
# Nice colors.
git clone git://github.com/altercation/vim-colors-solarized.git

# Helpful tools.
git clone https://github.com/mileszs/ack.vim.git
git clone --depth=1 https://github.com/vim-syntastic/syntastic.git
git clone https://github.com/majutsushi/tagbar.git
git clone https://github.com/tpope/vim-fugitive.git
git clone https://github.com/editorconfig/editorconfig-vim.git

# Python.
git clone https://github.com/klen/python-mode.git

# Go.
# See instead: https://github.com/alex-lee/neovimconfig

# Typescript.
git clone https://github.com/leafgarland/typescript-vim.git
git clone https://github.com/Quramy/tsuquyomi.git

# Additional syntax highlighting.
git clone https://github.com/plasticboy/vim-markdown.git
git clone https://github.com/eloycoto/vim-ser.git
git clone https://github.com/b4b4r07/vim-hcl.git
git clone https://github.com/cespare/vim-toml.git toml
git clone https://github.com/nathanielc/vim-tickscript.git
```

These are less likely to be of interest.
```
git clone https://github.com/pangloss/vim-javascript.git
git clone https://github.com/sukima/xmledit.git
git clone git://github.com/digitaltoad/vim-jade.git
```
