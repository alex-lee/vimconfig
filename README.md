# Vim setup notes

Clone this repository into `~/.vim` and use `vimrc.home` as your
`~/.vimrc`:

```
ln -s ~/.vim/vimrc.home ~/.vimrc
```

This config expects vim 8.

## Plugins

This repository includes a recent version of
[vim-plug](https://github.com/junegunn/vim-plug). A list of plugins to use is
specified in `plugins.vim`.

## Language support

Language support is provided by [vim-lsp] and [vim-lsp-settings].

[vim-lsp]: https://github.com/mattn/vim-lsp-settings/
[vim-lsp-settings]: https://github.com/mattn/vim-lsp-settings/

Open any supported file type and run `:LspInstallServer`.

For further details, see `lsp.vim`.

### Python

Make sure the python language server has been installed. Then run the following to add support for
flake8 and mypy:

```sh
$ ~/.local/share/vim-lsp-settings/servers/pyls/venv/bin/pip install flake8 mypy pyls_mypy future
```

Example flake8 customization:

```
$ cat ~/.config/flake8
[flake8]
max_line_length = 100
```
