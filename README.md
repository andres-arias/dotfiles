# Personal dotfiles
Configuration files for my current setup.

Since I use both Windows and macOS on a daily basis, I try to keep a setup
for both platforms.

## Requirements

### macOS
* GNU stow
* tmux
* Zsh
* Neovim
    * gcc, clang or zig for compiling tree-sitter parsers.
    * Node and npm for installing LSPs.

## Setup

### macOS

```sh
brew install stow
stow zsh
stow nvim
stow tmux
```

## Linux archive

I use to be huge Linux ricer, under the `linux_archive` folder you'll find the
dotfiles I used during my personal Linux days. It's been a while since I used
Linux for my work computers, so keep in mind that those files are most likely
out of date.
