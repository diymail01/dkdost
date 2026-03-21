#!/usr/bin/env bash
#
# theme-switch — Switch NixOS Stylix color scheme via Rofi
#
# How it works:
#   1. Shows a Rofi menu with theme names
#   2. Uses sed to swap the base16Scheme filename in theme.nix
#   3. Runs nixos-rebuild to apply natively
#
# Bound to: SUPER + SHIFT + T

THEME_FILE="$HOME/nixos-config/home/batman/theme.nix"

declare -A THEMES
THEMES["  Gruvbox Dark"]="gruvbox-dark-medium"
THEMES["  Catppuccin Macchiato"]="catppuccin-macchiato"
THEMES["  Tokyo Night"]="tokyo-night-dark"
THEMES["  Nord"]="nord"
THEMES["  Dracula"]="dracula"
THEMES["  Everforest"]="everforest-dark-hard"
THEMES["  Rose Pine"]="rose-pine"
THEMES["  Solarized Dark"]="solarized-dark"

# Build menu
menu=""
for name in "${!THEMES[@]}"; do
  menu+="$name"$'\n'
done

# Remove trailing newline
menu="${menu%$'\n'}"

chosen=$(printf '%s' "$menu" | rofi -dmenu -i -p "Theme" \
  -theme-str 'window {width: 28em; border-radius: 12px;} listview {lines: 8; spacing: 4px;} element {padding: 10px 14px; border-radius: 8px;}')

[ -z "$chosen" ] && exit 0

scheme="${THEMES[$chosen]}"

if [ -z "$scheme" ]; then
  notify-send "Theme Switcher" "Unknown theme: $chosen"
  exit 1
fi

notify-send -t 8000 "Theme Switcher" "Switching to ${chosen}...\nThis will take a moment."

# Replace the YAML filename in the base16Scheme line
# Matches: base16Scheme = "${pkgs.base16-schemes}/share/themes/ANYTHING.yaml";
sed -i "s|/share/themes/[a-zA-Z0-9_-]*\.yaml|/share/themes/${scheme}.yaml|" "$THEME_FILE"

# Open a terminal to show rebuild progress
kitty --title "Theme Rebuild" -e bash -c "
  echo '>>> Rebuilding with theme: ${chosen}'
  echo ''
  sudo nixos-rebuild switch --flake $HOME/nixos-config#user0
  echo ''
  if [ \$? -eq 0 ]; then
    echo '>>> Theme applied successfully!'
  else
    echo '>>> Build failed. Check errors above.'
  fi
  echo ''
  echo 'Press any key to close...'
  read -n 1
"
