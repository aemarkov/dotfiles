#!/bin/sh

rm $HOME/.zshrc

REPO=https://github.com/Garrus007/dotfiles.git
GIT_DIR=$HOME/dotfiles
WORKING_DIR=$HOME

git clone --bare "$REPO" "$GIT_DIR/.git"
cd "$GIT_DIR"
git config --local status.showUntrackedFiles no
git --work-tree="$WORKING_DIR" checkout master

