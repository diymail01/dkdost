{ pkgs, lib, ... }:

{
  stylix = {
    enable = true;

    # Prevent Stylix from managing things we control dynamically via pywal
    targets.hyprpaper.enable = lib.mkForce false;
    targets.waybar.enable = false;
    targets.rofi.enable = false;

    # --- Color scheme (base fallback, pywal overrides at runtime) ---
    base16Scheme = "${pkgs.base16-schemes}/share/themes/everforest-dark-hard.yaml";

    # --- Wallpaper ---
    image = ../../assets/wallpapers/bruce.jpg;

    # --- Fonts ---
    fonts = {
      monospace = {
        package = pkgs.jetbrains-mono;
        name = "JetBrains Mono";
      };
      sansSerif = {
        package = pkgs.adwaita-fonts;
        name = "Adwaita Sans";
      };
      serif = {
        package = pkgs.noto-fonts;
        name = "Noto Serif";
      };
      emoji = {
        package = pkgs.noto-fonts-color-emoji;
        name = "Noto Color Emoji";
      };
      sizes = {
        applications = 11;
        desktop = 11;
        popups = 10;
        terminal = 12;
      };
    };

    # --- Cursor ---
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
    };

    # --- Opacity ---
    opacity = {
      terminal = 0.92;
      popups = 0.95;
    };
  };
}
