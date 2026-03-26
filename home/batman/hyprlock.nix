{ pkgs, lib, ... }:

{
  # Disable Stylix's hyprlock target to avoid conflicts
  stylix.targets.hyprlock.enable = lib.mkForce false;

  programs.hyprlock = {
    enable = true;

    settings = {
      general = {
        disable_loading_bar = false;
        hide_cursor = true;
        no_fade_in = false;
        grace = 0;
      };

      # Background — actual wallpaper image with light blur
      background = lib.mkForce [
        {
          monitor = "";
          path = "$HOME/.cache/current_wallpaper";
          blur_passes = 2;
          blur_size = 4;
          noise = 0.0117;
          contrast = 0.8916;
          brightness = 0.8172;
          vibrancy = 0.1696;
        }
      ];

      # Password input field — positioned at the bottom
      input-field = lib.mkForce [
        {
          monitor = "";
          size = "250, 60";
          outline_thickness = 2;
          dots_size = 0.2;
          dots_spacing = 0.2;
          dots_center = true;
          outer_color = "rgba(0, 0, 0, 0)";
          inner_color = "rgba(100, 114, 125, 0.5)";
          font_color = "rgb(200, 200, 200)";
          fade_on_empty = false;
          font_family = "JetBrains Mono";
          placeholder_text = "<i><span foreground=\"##ffffff99\">Hi, $USER</span></i>";
          hide_input = false;
          position = "0, -290";
          halign = "center";
          valign = "center";
        }
      ];

      label = lib.mkForce [
        # Hour-Time (Gold)
        {
          monitor = "";
          text = ''cmd[update:1000] echo -e "$(date +"%H")"'';
          color = "rgba(255, 185, 0, 0.6)";
          font_size = 180;
          font_family = "JetBrains Mono ExtraBold";
          position = "0, 300";
          halign = "center";
          valign = "center";
        }
        # Minute-Time (White)
        {
          monitor = "";
          text = ''cmd[update:1000] echo -e "$(date +"%M")"'';
          color = "rgba(255, 255, 255, 0.6)";
          font_size = 180;
          font_family = "JetBrains Mono ExtraBold";
          position = "0, 75";
          halign = "center";
          valign = "center";
        }
        # Day-Date-Month formatting (White + Gold)
        {
          monitor = "";
          text = ''cmd[update:1000] echo "<span color='##ffffff99'>$(date '+%A, ')</span><span color='##ffb90099'>$(date '+%d %B')</span>"'';
          font_size = 30;
          font_family = "JetBrains Mono Bold";
          position = "0, -80";
          halign = "center";
          valign = "center";
        }
        # User Icon
        {
          monitor = "";
          text = "";
          color = "rgba(255, 255, 255, 0.65)";
          font_size = 100;
          font_family = "JetBrainsMono Nerd Font";
          position = "0, -180";
          halign = "center";
          valign = "center";
        }
      ];
    };
  };
}
