#!/usr/bin/env bash
#
# wall-switch — Rofi-based wallpaper + pywal16 theme switcher
#
# Usage: wall-switch [WALLPAPER_DIR]
# Default dir: ~/nixos-config/assets/wallpapers

WALL_DIR="${1:-$HOME/nixos-config/assets/wallpapers}"
CACHE_DIR="$HOME/.cache/wall-switch"

mkdir -p "$CACHE_DIR"

# Find all images
shopt -s nullglob
images=("$WALL_DIR"/*.{jpg,jpeg,png,webp})
shopt -u nullglob

if [ ${#images[@]} -eq 0 ]; then
  notify-send "wall-switch" "No images found in $WALL_DIR"
  exit 1
fi

# Build rofi menu entries (filename only)
entries=""
for img in "${images[@]}"; do
  entries+="$(basename "$img")\n"
done

# Show rofi picker
chosen=$(echo -e "$entries" | rofi -dmenu -p " Wallpaper" -theme-str 'listview { lines: 8; }')

if [ -z "$chosen" ]; then
  exit 0
fi

WALLPAPER="$WALL_DIR/$chosen"

# Set wallpaper via swww (smooth transition)
swww img "$WALLPAPER" --transition-type grow --transition-duration 2 --transition-fps 60

# Generate color scheme from wallpaper
wal -i "$WALLPAPER" -q

# Reload kitty colors
if pgrep -x kitty > /dev/null; then
  for pid in $(pgrep -x kitty); do
    kitty @ --to unix:/tmp/kitty-"$pid" set-colors --all "$HOME/.cache/wal/colors-kitty.conf" 2>/dev/null
  done
fi

# Reload waybar
if pgrep -x waybar > /dev/null; then
  pkill waybar && waybar &
  disown
fi

notify-send "wall-switch" "Applied: $chosen"
