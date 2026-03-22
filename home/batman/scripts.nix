{ ... }:

{
  # All script installs and dotfile configs live here
  # Keeps packages.nix clean (just package lists)

  # --- Script installs to ~/.local/bin ---
  home.file.".local/bin/wall-switch" = {
    source = ./scripts/wall-switch.sh;
    executable = true;
  };

  home.file.".local/bin/wall-picker" = {
    source = ./scripts/wall-picker.sh;
    executable = true;
  };

  home.file.".local/bin/power-menu" = {
    source = ./scripts/power-menu.sh;
    executable = true;
  };

  home.file.".local/bin/bluetooth-menu" = {
    source = ./scripts/bluetooth-menu.sh;
    executable = true;
  };

  home.file.".local/bin/volume-menu" = {
    source = ./scripts/volume-menu.sh;
    executable = true;
  };

  # --- Pywal Waybar template ---
  # Pywal reads this template and generates colors-waybar.css in ~/.cache/wal/
  home.file.".config/wal/templates/colors-waybar.css" = {
    source = ./pywal-templates/colors-waybar.css;
  };

  home.file.".config/wal/templates/colors-gtk.css" = {
    source = ./pywal-templates/colors-gtk.css;
  };

  home.file.".config/wal/templates/colors-swaync.css" = {
    source = ./pywal-templates/colors-swaync.css;
  };

  # --- networkmanager_dmenu config ---
  home.file.".config/networkmanager-dmenu/config.ini".text = ''
[dmenu]
dmenu_command = rofi -dmenu -i -p "Wi-Fi"

[editor]
terminal = kitty
gui_if_available = True

[nmdm]
rescan_delay = 5
  '';
}
