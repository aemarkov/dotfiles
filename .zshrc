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

export EDITOR=vim
export TERM=xterm
alias config='git --git-dir=$HOME/dotfiles/.git --work-tree=$HOME'

# ROS
source /opt/ros/noetic/setup.zsh
source $HOME/ros/devel/setup.zsh

# edk2
EDK_PATH=$HOME/programming/edk2/edk2
export PATH=$PATH:$EDK_PATH
export EDK_TOOLS_PATH=$EDK_PATH/BaseTools

# Chromium depot_tools
export PATH=$PATH:$HOME/programs/depot_tools
