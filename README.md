# Dotfiles collection

Configuration files for:

* Neovim
* Vim (very basic config without plugins)
* Tmux
* Bash
* Shell colors
* Git
* iTerm2 (`install.sh` won't do anything with it)

## Installation
```
git clone --recursive https://github.com/quozd/dotfiles ~/.dotfiles
cd ~/.dotfiles
./install.sh
```

## Updating
```
git pull && git submodule update --init --recursive
cd ~/.dotfiles
./install.sh
```

## Caveats

Install script will override all existing symbolic links
