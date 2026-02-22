{ pkgs, lib, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      # -------------------------------------------------
      # Monitor (auto-detect)
      # -------------------------------------------------
      monitor = ",preferred,auto,1";

      # -------------------------------------------------
      # Startup
      # -------------------------------------------------
      exec-once = [
        "waybar"
        "dunst"
        "swww-daemon"
      ];

      # -------------------------------------------------
      # Input
      # -------------------------------------------------
      input = {
        kb_layout = "us";
        follow_mouse = 1;
        sensitivity = 0;
        touchpad = {
          natural_scroll = true;
          tap-to-click = true;
        };
      };

      # -------------------------------------------------
      # General
      # -------------------------------------------------
      general = {
        gaps_in = 4;
        gaps_out = 8;
        border_size = 2;
        layout = "dwindle";
      };

      # -------------------------------------------------
      # Decoration
      # -------------------------------------------------
      decoration = {
        rounding = 8;
        blur = {
          enabled = true;
          size = 6;
          passes = 2;
        };
        shadow = {
          enabled = true;
          range = 8;
          render_power = 2;
        };
      };

      # -------------------------------------------------
      # Animations
      # -------------------------------------------------
      animations = {
        enabled = true;
        bezier = "ease, 0.25, 0.1, 0.25, 1.0";
        animation = [
          "windows, 1, 4, ease, slide"
          "windowsOut, 1, 4, ease, slide"
          "fade, 1, 4, ease"
          "workspaces, 1, 3, ease, slide"
        ];
      };

      # -------------------------------------------------
      # Layout
      # -------------------------------------------------
      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      # -------------------------------------------------
      # Key bindings
      # -------------------------------------------------
      # Moved to hyprland-binds.nix for modularity


      # -------------------------------------------------
      # Window rules
      # -------------------------------------------------
      windowrulev2 = [
        "float, class:^(pavucontrol)$"
        "float, class:^(nm-connection-editor)$"
        "float, title:^(Picture-in-Picture)$"
      ];
    };
  };

  # Notification daemon
  services.dunst = {
    enable = true;
    settings = {
      global = {
        width = 300;
        height = 100;
        offset = "20x20";
        origin = "top-right";
        frame_width = 2;
        corner_radius = 8;
      };
    };
  };
}
