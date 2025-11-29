#!/bin/bash

options="Lock
Screensaver
Suspend
Restart
Shutdown"

selected=$(echo -e "$options" | rofi -dmenu -p "Power Menu")

case "$selected" in
  "Lock") hyprlock ;;
  "Screensaver") omarchy-launch-screensaver ;;
  "Suspend") systemctl suspend ;;
  "Restart") systemctl reboot ;;
  "Shutdown") systemctl poweroff ;;
  *) exit 1 ;;
esac
