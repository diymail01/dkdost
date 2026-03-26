#!/usr/bin/env bash
#
# power-menu.sh — Rofi power menu for Hyprland
# Bound to: SUPER + X

options="  Lock\n  Logout\n  Reboot\n  Shutdown\n  Suspend"

chosen=$(echo -e "$options" | rofi -dmenu -i -p "Power" \
  -theme-str 'window {width: 48em; border-radius: 16px; padding: 20px;} listview {columns: 5; lines: 1; spacing: 12px; layout: vertical;} element {padding: 20px 10px; border-radius: 12px;} element-text {horizontal-align: 0.5; font: "JetBrainsMono Nerd Font 14";}')

case "$chosen" in
  *Lock)     hyprlock ;;
  *Logout)   hyprctl dispatch exit ;;
  *Reboot)   systemctl reboot ;;
  *Shutdown) systemctl poweroff ;;
  *Suspend)  systemctl suspend ;;
esac
