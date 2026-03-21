#!/usr/bin/env bash
#
# wall-switch — Rofi wallpaper picker + swww
#
# Just changes the wallpaper. No pywal (Stylix handles colors).
# Bound to: SUPER + T

WALL_DIR="${1:-$HOME/nixos-config/assets/wallpapers}"

# Find all images
shopt -s nullglob
images=("$WALL_DIR"/*.{jpg,jpeg,png,webp})
shopt -u nullglob

if [ ${#images[@]} -eq 0 ]; then
  notify-send "Wallpaper" "No images found in $WALL_DIR"
  exit 1
fi

# Build menu entries
menu=""
for img in "${images[@]}"; do
  menu+="$(basename "$img")"$'\n'
done
menu="${menu%$'\n'}"

# Show picker
chosen=$(printf '%s' "$menu" | rofi -dmenu -i -p "Wallpaper" \
  -theme-str 'window {width: 30em; border-radius: 12px;} listview {lines: 8; spacing: 4px;} element {padding: 10px 14px; border-radius: 8px;}')

[ -z "$chosen" ] && exit 0

WALLPAPER="$WALL_DIR/$chosen"

if [ ! -f "$WALLPAPER" ]; then
  notify-send "Wallpaper" "File not found: $chosen"
  exit 1
fi

# Ensure swww daemon is running
pgrep -x swww-daemon > /dev/null || swww-daemon &

# Set wallpaper with smooth transition
swww img "$WALLPAPER" \
  --transition-type grow \
  --transition-duration 2 \
  --transition-fps 60 \
  --transition-pos "$(hyprctl cursorpos)" 2>/dev/null \
  || swww img "$WALLPAPER" --transition-type fade --transition-duration 1

notify-send "Wallpaper" "Applied: $chosen"
