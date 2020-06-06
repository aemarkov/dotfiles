# dotfiles
My configuration files

Main components:
 - i3-gaps
 - compton
 - Polybar
 - Alacritty
 - Rofi
 - Ranger
 - Neovim
 - Zsh
 
 Other configuration files (outdated):
  - i3status
  - termite

## Docs
 - [vim](dotfiles/doc/vim-cheatshit.md): my noobies Vim cheatshit and keybindings

## How to use
Repo should be placed somewhere, but working tree should be `$HOME`

1. Clone repo to the `$HOME/dotfiles`
2. Configure `git config --local status.showUntrackedFiles no` 
3. Use alias `config` from `.zshrc`: `alias config='git --git-dir=$HOME/dotfiles/.git --work-tree=$HOME'`
