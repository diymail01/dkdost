{ config, lib, ... }:

{
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";

    bind = [
      # App launchers
      "$mod, Return, exec, kitty"
      "$mod, D, exec, rofi -show drun -theme-str 'window {width: 45em; border-radius: 12px;} listview {columns: 2; lines: 8; spacing: 8px;} element {padding: 8px; border-radius: 8px;}'"
      "$mod, Q, killactive,"
      "$mod, F, fullscreen,"
      "$mod, V, togglefloating,"
      "$mod, P, pseudo,"
      "$mod, S, togglesplit,"

      # Focus movement (vim keys)
      "$mod, H, movefocus, l"
      "$mod, L, movefocus, r"
      "$mod, K, movefocus, u"
      "$mod, J, movefocus, d"

      # Workspace switching
      "$mod, 1, workspace, 1"
      "$mod, 2, workspace, 2"
      "$mod, 3, workspace, 3"
      "$mod, 4, workspace, 4"
      "$mod, 5, workspace, 5"
      "$mod, 6, workspace, 6"
      "$mod, 7, workspace, 7"
      "$mod, 8, workspace, 8"
      "$mod, 9, workspace, 9"

      # Move to workspace
      "$mod SHIFT, 1, movetoworkspace, 1"
      "$mod SHIFT, 2, movetoworkspace, 2"
      "$mod SHIFT, 3, movetoworkspace, 3"
      "$mod SHIFT, 4, movetoworkspace, 4"
      "$mod SHIFT, 5, movetoworkspace, 5"
      "$mod SHIFT, 6, movetoworkspace, 6"
      "$mod SHIFT, 7, movetoworkspace, 7"
      "$mod SHIFT, 8, movetoworkspace, 8"
      "$mod SHIFT, 9, movetoworkspace, 9"

      # Screenshot
      ", Print, exec, grimblast copy area"

      # Wallpaper switcher
      "$mod, T, exec, ~/.local/bin/wall-switch"

      # Theme switcher
      "$mod SHIFT, T, exec, ~/.local/bin/theme-switch"

      # Power menu
      "$mod, X, exec, ~/.local/bin/power-menu"

      # Lock screen
      "$mod SHIFT, L, exec, hyprlock"
    ];

    # Mouse binds
    bindm = [
      "$mod, mouse:272, movewindow"
      "$mod, mouse:273, resizewindow"
    ];

    # Brightness / Volume keys (hardware keys — works even without waybar)
    bindel = [
      ", XF86MonitorBrightnessUp, exec, brightnessctl set +5%"
      ", XF86MonitorBrightnessDown, exec, brightnessctl set 5%-"
      ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"
      ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
    ];
  };
}
