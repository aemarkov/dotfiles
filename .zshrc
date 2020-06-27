### ZSH SETTINGS ##############################################################

CONFIG=$HOME/.config
export ZSH=$HOME/.oh-my-zsh
# note: should be exported before sourcing zsh, otherwise searching history with
# prefix won't work
export TERM=xterm  
ZSH_THEME="garrus"
COMPLETION_WAITING_DOTS="true"

plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

# Disable history sharing between tabs
unsetopt share_history

### ENVIRONMENT SETTINGS ######################################################

# Default editor
export EDITOR=vim

# All environment-specific settings
source $CONFIG/environment

export TERM=xterm
