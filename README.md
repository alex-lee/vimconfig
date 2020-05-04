# Configuration for Vim and Neovim

These configs can be used with vim 8 and/or neovim. Clone this repository into `~/.vim` or
`~/.config/nvim`. (For shared use, clone to one location, then symlink to the other.)

For vim 8, set up the following symlink:

```
ln -s ~/.vim/init.vim ~/.vimrc
```

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

Make sure that [flake8] and [mypy] are available. The easiest way to install is via [pipx]. For best
results, make sure these are installed with the most recent version of Python (e.g., `pipx install
flake8 --python ~/.pyenv/versions/3.8.2/bin/python`).

Example `~/.config/flake8`:

```
[flake8]
max_line_length = 100
```

Example `~/.config/mypy/config`. The `python_executable` setting ensures that the virtualenv's
interpreter is used.

```
[mypy]
python_executable = $HOME/.pyenv/shims/python
ignore_missing_imports = True
```

Currently I find best results using these via [efm-langserver][efm-langserver] (as described below).

For formatting support, adding the [pyls-black] or [pyls-black-macchiato] plugin is recommended.
This should be installed in the same virtualenv as `pyls`:

```
$ ~/.local/share/vim-lsp-settings/servers/pyls/venv/bin/pip install pyls-black-macchiato
```

[flake8]: http://flake8.pycqa.org/en/latest/index.html
[mypy]: http://mypy-lang.org/
[pipx]: https://github.com/pipxproject/pipx
[pyls-black]: https://github.com/rupert/pyls-black
[pyls-black-macchiato]: https://github.com/alex-lee/pyls-black-macchiato

### efm-langserver

To augment functionality in a filetype's main LSP server, [efm-langserver] is used.

* Copy or symlink this repository's `efm-langserver-config.yaml` to
  `~/.config/efm-langserver/config.yaml`. Or make your own from scratch.
* Then `:LspInstallServer efm-langserver`.

To add support for additional filetypes or tools:

* Add the filetype to the whitelist in `g:lsp_settings['efm-langserver']` (see `lsp.vim`).
* Update `~/.config/efm-langserver/config.yaml` as desired.

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
