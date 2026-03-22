#!/usr/bin/env bash
#
# wall-picker.sh — Visual Rofi wallpaper picker with full pywal recoloring
# Sets wallpaper + recolors Waybar, SwayNC, GTK, and Kitty terminal
# Bound to: SUPER + T

WALL_DIR="${1:-$HOME/nixos-config/assets/wallpapers}"
PYWAL_TEMPLATE_DIR="$HOME/.config/wal/templates"

# Ensure pywal template dirs exist and templates are installed
mkdir -p "$PYWAL_TEMPLATE_DIR"
for tmpl in colors-waybar.css colors-gtk.css colors-swaync.css; do
  src="$HOME/nixos-config/home/batman/pywal-templates/$tmpl"
  if [ -f "$src" ]; then
    cp "$src" "$PYWAL_TEMPLATE_DIR/$tmpl"
  fi
done

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
    window { width: 60em; border-radius: 14px; padding: 16px; }
    mainbox { spacing: 12px; }
    inputbar { padding: 10px 14px; border-radius: 10px; }
    listview { columns: 3; lines: 2; spacing: 10px; fixed-columns: true; }
    element { padding: 10px; border-radius: 12px; orientation: vertical; }
    element-icon { size: 14em; border-radius: 10px; }
    element-text { horizontal-align: 0.5; padding: 6px 0 0 0; }
    element selected { border: 2px; }
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

# 2. Generate ALL color templates from the wallpaper
wal -i "$FULL_PATH" -n -q -e

# 3. Apply SwayNC colors
if [ -f "$HOME/.cache/wal/colors-swaync.css" ]; then
  mkdir -p "$HOME/.config/swaync"
  cp "$HOME/.cache/wal/colors-swaync.css" "$HOME/.config/swaync/style.css"
  swaync-client --reload-css 2>/dev/null
fi

# 4. Recolor Kitty terminal (if running)
if pgrep -x kitty >/dev/null 2>&1; then
  source "$HOME/.cache/wal/colors.sh" 2>/dev/null
  kitty @ --to unix:/tmp/kitty set-colors \
    foreground="$foreground" background="$background" \
    cursor="$cursor" 2>/dev/null || true
fi

# 5. Reload Waybar with new colors
pkill waybar
sleep 0.3
waybar &disown

notify-send "Wallpaper" "Applied: $chosen — All colors updated!"
