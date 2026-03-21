{ pkgs, ... }:

{
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  home.packages = with pkgs; [
    # --- CLI tools ---
    bat
    btop
    ripgrep
    fd
    eza
    fzf
    unzip

    # --- GNOME ---
    gnomeExtensions.user-themes

    # --- Hyprland ecosystem ---
    swww                  # wallpaper daemon
    grimblast             # screenshot
    wl-clipboard          # clipboard
    pavucontrol           # audio control GUI
    networkmanagerapplet  # network tray
    brightnessctl         # backlight control
    blueman               # bluetooth tray
    hyprpicker            # color picker

    # --- Fonts & Theming ---
    nerd-fonts.jetbrains-mono  # icons for waybar
    papirus-icon-theme         # icons for rofi
  ];

  # Install scripts to ~/.local/bin
  home.file.".local/bin/wall-switch" = {
    source = ./scripts/wall-switch.sh;
    executable = true;
  };

  home.file.".local/bin/theme-switch" = {
    source = ./scripts/theme-switch.sh;
    executable = true;
  };
}
