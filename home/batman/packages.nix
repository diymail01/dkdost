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

    # --- Theming / wallpaper switcher ---
    pywal16               # generate colors from wallpaper
    imagemagick           # image manipulation for thumbnails
    papirus-icon-theme    # icons for rofi
  ];

  # Install wall-switch script to ~/.local/bin
  home.file.".local/bin/wall-switch" = {
    source = ./scripts/wall-switch.sh;
    executable = true;
  };
}
