export ZSH=$HOME/.oh-my-zsh
export TERM=xterm

ZSH_THEME="garrus"
COMPLETION_WAITING_DOTS="true"

plugins=(
  git
)

source $ZSH/oh-my-zsh.sh


# Show only last two dirs
DEFAULT_USER=$USER
prompt_dir() {
  prompt_segment blue black %2~
}

# Disable history sharing between tabs
unsetopt share_history

###################################
#!/bin/bash


# Default editor
export EDITOR=vim

source $HOME/.config/environment


