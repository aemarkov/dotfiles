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

# Default editor
export EDITOR=vim

# Tilix fix
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
    source /etc/profile.d/vte.sh
fi

# Disable .NET telemetry
export DOTNET_CLI_TELEMETRY_OPTOUT=1

# ROS setup
# We have already source it in ~/.xsessionrc, but we need
# to source *.zsh to enable smart completion
export ROS_OS_OVERRIDE=ubuntu:18.04:bionic
source /opt/ros/melodic/setup.zsh
source /home/garrus/ros/devel/setup.zsh

# Java settings
export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64
export PATH=$PATH:$JAVA_HOME/bin

# Other PATH configuration
export PATH=$PATH:/usr/local/texlive/2020/bin/x86_64-linux/

# For dotfiles repository
alias config='git --git-dir=$HOME/dotfiles/.git --work-tree=$HOME'

export WORKON_HOME=$HOME/.venv/
export VIRTUALENVWRAPPER_PYTHON=$(which python3)
source $HOME/.local/bin/virtualenvwrapper.sh
