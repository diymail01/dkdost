{ ... }:

{
  # All script installs and dotfile configs live here
  # Keeps packages.nix clean (just package lists)

  # --- Script installs to ~/.local/bin ---
  home.file.".local/bin/wall-switch" = {
    source = ./scripts/wall-switch.sh;
    executable = true;
  };

  home.file.".local/bin/theme-switch" = {
    source = ./scripts/theme-switch.sh;
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

  # --- networkmanager_dmenu config ---
  home.file.".config/networkmanager-dmenu/config.ini".text = ''
    [dmenu]
    dmenu_command = rofi -dmenu -i -p "Wi-Fi" -theme-str 'window {width: 30em; border-radius: 12px;} listview {lines: 10; spacing: 4px;} element {padding: 10px 14px; border-radius: 8px;}'
    wifi_rescan = true

    [editor]
    terminal = kitty
    gui_if_available = True
  '';
}
