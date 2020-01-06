# Vim setup notes

Clone this repository into `~/.vim` and use `vimrc.home` as your
`~/.vimrc`:
```
ln -s ~/.vim/vimrc.home ~/.vimrc
```

This config expects vim 8.

## Python support

For simple linting I use `flake8`, via Syntastic. Installing via
[pipx](https://github.com/pipxproject/pipx) is recommended.

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

## Plugins

This repository includes a recent version of
[vim-plug](https://github.com/junegunn/vim-plug). A list of plugins to use is
specified in `plugins.vim`.
