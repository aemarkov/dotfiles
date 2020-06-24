#!/bin/zsh
ROS_LOCAL="/opt/ros/$ROS_DISTRO/setup.zsh"
source "/opt/ros/$ROS_DISTRO/setup.zsh"
if [[ -f $ROS_LOCAL ]]; then
    source $ROS_LOCAL
fi

exec "$@"

