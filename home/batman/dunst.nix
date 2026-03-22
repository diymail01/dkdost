{ ... }:

{
  # Notification daemon (extracted from hyprland.nix for modularity)
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
        separator_height = 2;
        padding = 8;
        horizontal_padding = 10;
        text_icon_padding = 10;
        icon_position = "left";
        max_icon_size = 48;
        line_height = 0;
        markup = "full";
        format = "<b>%s</b>\n%b";
        alignment = "left";
        show_age_threshold = 60;
        word_wrap = true;
        mouse_left_click = "do_action, close_current";
        mouse_middle_click = "close_all";
        mouse_right_click = "close_current";
      };
    };
  };
}
