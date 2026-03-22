{ pkgs, ... }:

{
  # Native GTK configuration configured to accept Pywal dynamic colors
  gtk = {
    enable = true;

    theme = {
      name = "adw-gtk3-dark";
      package = pkgs.adw-gtk3;
    };

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    font = {
      name = "Adwaita Sans";
      size = 11;
    };

    # Inject the Pywal GTK template directly into GTK3/GTK4 css
    # Whenever pywal runs (via wall-picker), GTK apps will pick up the new variables automatically
    gtk3.extraCss = ''
      @import url("file:///home/batman/.cache/wal/colors-gtk.css");
    '';

    gtk4.extraCss = ''
      @import url("file:///home/batman/.cache/wal/colors-gtk.css");
    '';
  };
}
