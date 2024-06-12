# Personal dotfiles
Configuration files for my current setup.

Since I use both Windows and macOS on a daily basis, I try to keep a common setup
for both platforms. This is possible thanks to [dotbot](https://github.com/anishathalye/dotbot).

## Requirements

### macOS
* Zsh
* tmux
* Neovim
    * gcc, clang or zig for compiling tree-sitter parsers.
    * Node and npm for installing LSPs.

### Windows
* Windows Terminal Preview
* Neovim
    * gcc, clang or zig for compiling tree-sitter parsers.
    * Node and npm for installing LSPs.

## Install

### macOS

```sh
git submodule update --init --recursive
./install
```

### Windows
```powershell
git submodule update --init --recursive
./install.ps1
```

## Linux archive

I use to be huge Linux ricer, under the `linux_archive` folder you'll find the
dotfiles I used during my personal Linux days. It's been a while since I used
Linux for my work computers, so keep in mind that those files are most likely
out of date.
