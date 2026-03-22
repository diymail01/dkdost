#!/usr/bin/env bash
#
# bluetooth-menu.sh — Rofi bluetooth device selector
# Uses bluetoothctl to list paired devices and toggle connection

# Get paired devices
paired=$(bluetoothctl devices Paired 2>/dev/null | sed 's/Device //')

if [ -z "$paired" ]; then
  notify-send "Bluetooth" "No paired devices found.\nOpen blueman-manager to pair."
  blueman-manager &
  exit 0
fi

# Build menu: "MAC Name" per line
menu=""
while IFS= read -r line; do
  mac=$(echo "$line" | awk '{print $1}')
  name=$(echo "$line" | cut -d' ' -f2-)
  connected=$(bluetoothctl info "$mac" 2>/dev/null | grep "Connected: yes")
  if [ -n "$connected" ]; then
    menu+="  $name (connected)\n"
  else
    menu+="  $name\n"
  fi
done <<< "$paired"

menu="${menu%\\n}"

chosen=$(echo -e "$menu" | rofi -dmenu -i -p "Bluetooth" \
  -theme-str 'window {width: 24em; border-radius: 12px;} listview {lines: 6; spacing: 4px;} element {padding: 10px 14px; border-radius: 8px;}')

[ -z "$chosen" ] && exit 0

# Extract device name (strip icon and status)
dev_name=$(echo "$chosen" | sed 's/^[^ ]* //' | sed 's/ (connected)$//')

# Find MAC for this device
mac=$(echo "$paired" | grep "$dev_name" | awk '{print $1}')

if [ -z "$mac" ]; then
  notify-send "Bluetooth" "Device not found"
  exit 1
fi

# Toggle connection
is_connected=$(bluetoothctl info "$mac" 2>/dev/null | grep "Connected: yes")
if [ -n "$is_connected" ]; then
  bluetoothctl disconnect "$mac"
  notify-send "Bluetooth" "Disconnected: $dev_name"
else
  bluetoothctl connect "$mac"
  notify-send "Bluetooth" "Connecting: $dev_name"
fi
