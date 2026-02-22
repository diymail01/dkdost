{ pkgs, ... }:

{
  programs.kitty = {
    enable = true;

    settings = {
      # --- Font (Stylix auto-sets colors) ---
      font_size = 12;
      disable_ligatures = "never";

      # --- Window ---
      window_padding_width = 8;
      hide_window_decorations = "yes";
      confirm_os_window_close = 0;

      # --- Scrollback ---
      scrollback_lines = 10000;

      # --- Bell ---
      enable_audio_bell = "no";
      visual_bell_duration = "0.0";

      # --- URLs ---
      url_style = "curly";
      detect_urls = "yes";

      # --- Cursor ---
      cursor_shape = "beam";
      cursor_blink_interval = "0.5";
    };

    keybindings = {
      "ctrl+shift+c" = "copy_to_clipboard";
      "ctrl+shift+v" = "paste_from_clipboard";
      "ctrl+shift+t" = "new_tab";
      "ctrl+shift+q" = "close_tab";
      "ctrl+shift+right" = "next_tab";
      "ctrl+shift+left" = "previous_tab";
      "ctrl+shift+plus" = "change_font_size all +1.0";
      "ctrl+shift+minus" = "change_font_size all -1.0";
      "ctrl+shift+0" = "change_font_size all 0";
    };
  };
}
