{ pkgs, ... }:

{
  stylix = {
    enable = true;

    # --- Color scheme ---
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";

    # --- Wallpaper ---
    image = ../../assets/wallpapers/bruce.jpg;

    # --- Fonts ---
    fonts = {
      monospace = {
        package = pkgs.jetbrains-mono;
        name = "JetBrains Mono";
      };
      sansSerif = {
        package = pkgs.noto-fonts;
        name = "Noto Sans";
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
      name = "Bibata-Modern-Classic";
      size = 24;
    };

    # --- Opacity ---
    opacity = {
      terminal = 0.92;
      popups = 0.95;
    };
  };
}
