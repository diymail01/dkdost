#!/usr/bin/env bash
#
# volume-menu.sh — Rofi quick volume control
# Replaces the full pavucontrol GTK app with a light Rofi popup

options="  Mute Toggle\n  25%\n  50%\n  75%\n  100%\n  Open Mixer"

chosen=$(echo -e "$options" | rofi -dmenu -i -p "Volume" \
  -theme-str 'window {width: 16em; border-radius: 12px;} listview {lines: 6; spacing: 4px;} element {padding: 10px 14px; border-radius: 8px;}')

case "$chosen" in
  *"Mute Toggle") wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle ;;
  *"25%")         wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.25 ;;
  *"50%")         wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.50 ;;
  *"75%")         wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.75 ;;
  *"100%")        wpctl set-volume @DEFAULT_AUDIO_SINK@ 1.00 ;;
  *"Open Mixer")  pavucontrol & ;;
esac
