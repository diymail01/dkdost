#!/usr/bin/env bash
#
# bluetooth-menu.sh — Rofi bluetooth device selector
# Uses bluetoothctl to list paired devices and toggle connection

# Power on bluetooth adapter
bluetoothctl power on &>/dev/null

# Get paired devices
paired=$(bluetoothctl devices Paired 2>/dev/null)

if [ -z "$paired" ]; then
  # If no paired devices, offer to open blueman for pairing
  action=$(echo -e "Scan for devices\nCancel" | rofi -dmenu -i -p "Bluetooth" \
    -theme-str 'window {width: 20em; border-radius: 12px;} listview {lines: 2; spacing: 4px;} element {padding: 10px 14px; border-radius: 8px;}')
  
  if [ "$action" = "Scan for devices" ]; then
    blueman-manager &
  fi
  exit 0
fi

# Build menu
menu=""
while IFS= read -r line; do
  mac=$(echo "$line" | awk '{print $2}')
  name=$(echo "$line" | cut -d' ' -f3-)
  
  info=$(bluetoothctl info "$mac" 2>/dev/null)
  connected=$(echo "$info" | grep "Connected: yes")
  
  if [ -n "$connected" ]; then
    menu+="[*] $name\n"
  else
    menu+="[ ] $name\n"
  fi
done <<< "$paired"

# Remove trailing newline
menu="${menu%\\n}"

chosen=$(echo -e "$menu" | rofi -dmenu -i -p "Bluetooth" \
  -theme-str 'window {width: 24em; border-radius: 12px;} listview {lines: 6; spacing: 4px;} element {padding: 10px 14px; border-radius: 8px;}')

[ -z "$chosen" ] && exit 0

# Extract device name (strip prefix)
dev_name=$(echo "$chosen" | sed 's/^\[.\] //')

# Find MAC for this device
mac=$(echo "$paired" | grep "$dev_name" | awk '{print $2}')

if [ -z "$mac" ]; then
  notify-send "Bluetooth" "Device not found"
  exit 1
fi

# Toggle connection
is_connected=$(bluetoothctl info "$mac" 2>/dev/null | grep "Connected: yes")
if [ -n "$is_connected" ]; then
  bluetoothctl disconnect "$mac" &>/dev/null
  notify-send "Bluetooth" "Disconnected: $dev_name"
else
  notify-send "Bluetooth" "Connecting to $dev_name..."
  bluetoothctl connect "$mac" &>/dev/null
  if [ $? -eq 0 ]; then
    notify-send "Bluetooth" "Connected: $dev_name"
  else
    notify-send "Bluetooth" "Failed to connect to $dev_name"
  fi
fi
