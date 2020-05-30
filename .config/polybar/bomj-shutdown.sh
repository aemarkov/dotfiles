#!/usr/bin/env bash

options="Logout\nShutdown\nReboot"
selected=$(echo -e "$options" | rofi -dmenu -i)

if [[ $selected = "Logout" ]]; then
    i3-msg exit
elif [[ $selected = "Shutdown" ]]; then
    shutdown now
elif [[ $selected = "Reboot" ]]; then
    reboot
fi

