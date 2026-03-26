{ pkgs, lib, ... }:

{
  # Disable Stylix's hyprlock target to avoid conflicts
  stylix.targets.hyprlock.enable = lib.mkForce false;

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
          blur_passes = 5;
          blur_size = 8;
          noise = 0.01;
          contrast = 0.75;
          brightness = 0.55;
          vibrancy = 0.20;
        }
      ];

      # Password input field — centered on screen
      input-field = lib.mkForce [
        {
          monitor = "";
          size = "300, 55";
          outline_thickness = 3;
          dots_size = 0.3;
          dots_spacing = 0.2;
          dots_center = true;
          dots_rounding = -1;
          outer_color = "rgba(122, 162, 247, 0.35)";
          inner_color = "rgba(0, 0, 0, 0.45)";
          font_color = "rgba(255, 255, 255, 0.95)";
          fade_on_empty = true;
          fade_timeout = 2000;
          placeholder_text = "<span foreground='##aaaacc'>  Enter Password</span>";
          hide_input = false;
          rounding = 22;
          check_color = "rgba(122, 162, 247, 0.7)";
          fail_color = "rgba(255, 85, 85, 0.8)";
          fail_text = "<span foreground='##ff5555'><i> $FAIL ($ATTEMPTS)</i></span>";
          fail_transition = 300;
          capslock_color = "rgba(255, 200, 50, 0.7)";
          position = "0, -40";
          halign = "center";
          valign = "center";
          shadow_passes = 3;
          shadow_size = 6;
          shadow_color = "rgba(0, 0, 0, 0.4)";
        }
      ];

      label = lib.mkForce [
        # Time — large, top area
        {
          monitor = "";
          text = ''cmd[update:1000] echo "$(date +"%H:%M")"'';
          color = "rgba(255, 255, 255, 0.95)";
          font_size = 120;
          font_family = "JetBrains Mono ExtraBold";
          position = "0, 280";
          halign = "center";
          valign = "center";
          shadow_passes = 3;
          shadow_size = 10;
          shadow_color = "rgba(0, 0, 0, 0.7)";
        }
        # Date — below time
        {
          monitor = "";
          text = ''cmd[update:60000] date +"%A, %B %d"'';
          color = "rgba(255, 255, 255, 0.65)";
          font_size = 20;
          font_family = "JetBrains Mono";
          position = "0, 180";
          halign = "center";
          valign = "center";
          shadow_passes = 2;
          shadow_size = 5;
          shadow_color = "rgba(0, 0, 0, 0.5)";
        }
        # Greeting — above input field
        {
          monitor = "";
          text = "Welcome back, $USER";
          color = "rgba(255, 255, 255, 0.80)";
          font_size = 14;
          font_family = "JetBrains Mono";
          position = "0, 20";
          halign = "center";
          valign = "center";
          shadow_passes = 2;
          shadow_size = 4;
          shadow_color = "rgba(0, 0, 0, 0.4)";
        }
        # Lock icon — above greeting
        {
          monitor = "";
          text = "";
          color = "rgba(122, 162, 247, 0.85)";
          font_size = 32;
          font_family = "JetBrainsMono Nerd Font";
          position = "0, 65";
          halign = "center";
          valign = "center";
          shadow_passes = 2;
          shadow_size = 4;
          shadow_color = "rgba(0, 0, 0, 0.3)";
        }
      ];
    };
  };
}
