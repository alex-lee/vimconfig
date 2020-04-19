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

Make sure that `flake8` and `mypy` are available. The easiest way to install is via [pipx]. For best
results, make sure these are installed with the most recent version of Python.

Example customizations:

```
$ cat ~/.config/flake8
[flake8]
max_line_length = 100

$ cat ~/.config/mypy/config
[mypy]
ignore_missing_imports = True
```

[pipx]: https://github.com/pipxproject/pipx

### efm-langserver

To augment functionality in a filetype's main LSP server, [efm-langserver] is used.

* Add the filetype to the whitelist in `g:lsp_settings['efm-langserver']` (see `lsp.vim`).
* Extend your `~/.config/efm-langserver/config.yaml` (a sample config is provided in this repo).

[efm-langserver]: https://github.com/mattn/efm-langserver

## Mappings

### vim-lsp

If a filetype has a language server installed, the following normal mode mappings will added:

* `gA` – show all diagnostics
* `[g` – go to previous diagnostic
* `]g` – go to next diagnostic
* `gd` – go to definition
* `gy` – go to type definition
* `gr` – show references (currently only works on current buffer…)
* `K` – show hover info
* `<leader>pc` – close preview window
* `<leader>F` – format document (or format range in visual mode)

### fzf

The following fzf normal mode mappings are defined:

* `<leader>ff` – search files
* `<leader>fb` – search loaded buffers
* `<leader>fl` – search lines in current buffer
* `<leader>fL` – search lines in loaded buffers
* `<leader>ft` – search tags in current buffer
* `<leader>fT` – search tags (sometimes requires tags to be rebuilt…)
* `<leader>rr` – ripgrep search
