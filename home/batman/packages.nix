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
    swww                   # wallpaper daemon
    grimblast              # screenshot
    wl-clipboard           # clipboard
    cliphist               # clipboard history manager
    pavucontrol            # audio control GUI (fallback)
    brightnessctl          # backlight control
    hyprpicker             # color picker
    networkmanager_dmenu   # rofi wifi menu
    pywal16                # dynamic color generation from wallpaper

    # --- Fonts & Theming ---
    nerd-fonts.jetbrains-mono  # icons for waybar
    papirus-icon-theme         # icons for rofi
    adw-gtk3                   # adwaita GTK3 theme
    libnotify                  # notify-send (required by swaync)
  ];
}
