#!/usr/bin/env bash
#
# power-menu.sh — Rofi power menu for Hyprland
# Bound to: SUPER + X

options="  Lock\n  Logout\n  Reboot\n  Shutdown\n  Suspend"

chosen=$(echo -e "$options" | rofi -dmenu -i -p "Power" \
  -theme-str 'window {width: 14em; border-radius: 12px; padding: 12px;} listview {lines: 5; spacing: 4px;} element {padding: 10px 14px; border-radius: 8px;}')

case "$chosen" in
  *Lock)     hyprlock ;;
  *Logout)   hyprctl dispatch exit ;;
  *Reboot)   systemctl reboot ;;
  *Shutdown) systemctl poweroff ;;
  *Suspend)  systemctl suspend ;;
esac
