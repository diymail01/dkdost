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
    pavucontrol            # audio control GUI (fallback)
    brightnessctl          # backlight control
    hyprpicker             # color picker
    networkmanager_dmenu   # rofi wifi menu

    # --- Fonts & Theming ---
    nerd-fonts.jetbrains-mono  # icons for waybar
    papirus-icon-theme         # icons for rofi
  ];
}
