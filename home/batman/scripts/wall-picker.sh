#!/usr/bin/env bash
#
# wall-picker.sh — Visual Rofi wallpaper picker with pywal color generation
# Shows a gallery of wallpaper thumbnails, applies the selection, and
# dynamically recolors Waybar + sends notification
# Bound to: SUPER + T

WALL_DIR="${1:-$HOME/nixos-config/assets/wallpapers}"
PYWAL_TEMPLATE_DIR="$HOME/.config/wal/templates"

# Ensure pywal template dir exists and our Waybar template is installed
mkdir -p "$PYWAL_TEMPLATE_DIR"
if [ ! -f "$PYWAL_TEMPLATE_DIR/colors-waybar.css" ]; then
  cp "$HOME/nixos-config/home/batman/pywal-templates/colors-waybar.css" \
     "$PYWAL_TEMPLATE_DIR/colors-waybar.css" 2>/dev/null
fi

# Ensure swww daemon is running
pgrep -x swww-daemon >/dev/null || swww-daemon &

# Find all images
shopt -s nullglob
images=("$WALL_DIR"/*.{jpg,jpeg,png,webp,bmp})
shopt -u nullglob

if [ ${#images[@]} -eq 0 ]; then
  notify-send "Wallpaper Picker" "No images found in $WALL_DIR"
  exit 1
fi

# Build Rofi input with image thumbnails
input=""
for img in "${images[@]}"; do
  name=$(basename "$img")
  input+="${name}\0icon\x1f${img}\n"
done

# Show visual Rofi gallery
chosen=$(printf "$input" | rofi -dmenu -i -p "Wallpaper" \
  -show-icons \
  -theme-str '
    window { width: 60em; }
    listview { columns: 3; lines: 2; spacing: 10px; fixed-columns: true; }
    element { padding: 10px; border-radius: 12px; orientation: vertical; }
    element-icon { size: 14em; border-radius: 10px; background-color: transparent; }
    element-text { horizontal-align: 0.5; padding: 6px 0 0 0; background-color: transparent; }
  ')

[ -z "$chosen" ] && exit 0

FULL_PATH="$WALL_DIR/$chosen"

# 1. Apply wallpaper with premium transition
CURSOR=$(hyprctl cursorpos 2>/dev/null | tr -d ' ')
X=$(echo "$CURSOR" | cut -d',' -f1)
Y=$(echo "$CURSOR" | cut -d',' -f2)

swww img "$FULL_PATH" \
  --transition-type grow \
  --transition-pos "${X:-960},${Y:-540}" \
  --transition-duration 1.5 \
  --transition-fps 60

# 2. Generate colors from the wallpaper using pywal
wal -i "$FULL_PATH" -n -q -e

# 3. Reload Waybar with new colors
pkill waybar
sleep 0.3
waybar &disown

notify-send "Wallpaper" "Applied: $chosen — Colors updated!"
