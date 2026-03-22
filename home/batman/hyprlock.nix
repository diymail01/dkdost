{ config, lib, ... }:

{
  programs.hyprlock = {
    enable = true;

    settings = {
      general = {
        disable_loading_bar = true;
        hide_cursor = true;
        no_fade_in = false;
      };

      # Stylix auto-injects: background, input-field colors, and fonts.
      # We only need to position the labels so they don't overlap.

      label = [
        # Time — top area
        {
          monitor = "";
          text = "$TIME";
          font_size = 95;
          font_family = "JetBrains Mono";
          position = "0, 200";
          halign = "center";
          valign = "center";
        }
        # Date
        {
          monitor = "";
          text = ''cmd[update:60000] date +"%A, %d %B"'';
          font_size = 18;
          font_family = "JetBrains Mono";
          position = "0, 110";
          halign = "center";
          valign = "center";
        }
        # Greeting — just above center
        {
          monitor = "";
          text = "Hi, $USER";
          font_size = 14;
          font_family = "JetBrains Mono";
          position = "0, -75";
          halign = "center";
          valign = "center";
        }
      ];
    };
  };
}
