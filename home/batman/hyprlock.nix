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

      # Background and colors will be automatically injected by Stylix!


      label = [
        # Clock
        {
          monitor = "";
          text = "$TIME";
          font_size = 120;
          font_family = "JetBrains Mono";
          position = "0, 80";
          halign = "center";
          valign = "center";
        }
        # Greeting
        {
          monitor = "";
          text = "Hi there, $USER";
          font_size = 25;
          font_family = "JetBrains Mono";
          position = "0, 0";
          halign = "center";
          valign = "center";
        }
      ];
    };
  };
}
