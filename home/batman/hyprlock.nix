{ config, lib, ... }:

{
  programs.hyprlock = {
    enable = true;

    settings = {
      general = {
        disable_loading_bar = true;
        hide_cursor = true;
        no_fade_in = false;
        grace = 0;
      };

      # Blurred wallpaper background
      background = lib.mkForce [
        {
          monitor = "";
          path = "screenshot";
          blur_passes = 4;
          blur_size = 6;
          noise = 0.02;
          contrast = 0.85;
          brightness = 0.65;
          vibrancy = 0.15;
        }
      ];

      # Circular profile picture
      image = lib.mkForce [
        {
          monitor = "";
          path = "$HOME/nixos-config/assets/wallpapers/bruce.jpg";
          size = 130;
          rounding = -1;   # -1 = perfect circle
          border_size = 3;
          border_color = "rgba(255, 255, 255, 0.3)";
          position = "0, 120";
          halign = "center";
          valign = "center";
          shadow_passes = 3;
          shadow_size = 6;
        }
      ];

      # Password input field
      input-field = lib.mkForce [
        {
          monitor = "";
          size = "280, 50";
          outline_thickness = 2;
          dots_size = 0.25;
          dots_spacing = 0.3;
          dots_center = true;
          dots_rounding = -1;
          outer_color = "rgba(255, 255, 255, 0.15)";
          inner_color = "rgba(0, 0, 0, 0.3)";
          font_color = "rgba(255, 255, 255, 0.9)";
          fade_on_empty = true;
          fade_timeout = 2000;
          placeholder_text = "<i>  Password...</i>";
          hide_input = false;
          rounding = 16;
          check_color = "rgba(122, 162, 247, 0.6)";
          fail_color = "rgba(255, 85, 85, 0.7)";
          fail_text = "<i>$FAIL <b>($ATTEMPTS)</b></i>";
          fail_transition = 200;
          capslock_color = "rgba(255, 200, 50, 0.6)";
          position = "0, -20";
          halign = "center";
          valign = "center";
          shadow_passes = 2;
          shadow_size = 4;
        }
      ];

      label = lib.mkForce [
        # Time — large, elegant
        {
          monitor = "";
          text = "$TIME";
          color = "rgba(255, 255, 255, 0.95)";
          font_size = 90;
          font_family = "JetBrains Mono";
          position = "0, 350";
          halign = "center";
          valign = "center";
          shadow_passes = 3;
          shadow_size = 8;
          shadow_color = "rgba(0, 0, 0, 0.6)";
        }
        # Date
        {
          monitor = "";
          text = ''cmd[update:60000] date +"%A, %d %B"'';
          color = "rgba(255, 255, 255, 0.75)";
          font_size = 16;
          font_family = "JetBrains Mono";
          position = "0, 275";
          halign = "center";
          valign = "center";
          shadow_passes = 2;
          shadow_size = 4;
          shadow_color = "rgba(0, 0, 0, 0.5)";
        }
        # Greeting — below profile image
        {
          monitor = "";
          text = "Hello, $USER";
          color = "rgba(255, 255, 255, 0.85)";
          font_size = 16;
          font_family = "JetBrains Mono";
          position = "0, 30";
          halign = "center";
          valign = "center";
          shadow_passes = 2;
          shadow_size = 4;
          shadow_color = "rgba(0, 0, 0, 0.4)";
        }
      ];
    };
  };
}
