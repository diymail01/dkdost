{ pkgs, lib, ... }:

{
  programs.waybar = {
    enable = true;

    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 38;
        margin-top = 6;
        margin-left = 8;
        margin-right = 8;
        spacing = 0;

        modules-left = [ "hyprland/workspaces" "hyprland/window" ];
        modules-center = [ "clock" ];
        modules-right = [ "tray" "pulseaudio" "backlight" "network" "bluetooth" "battery" ];

        "hyprland/workspaces" = {
          format = "{icon}";
          format-icons = {
            "1" = "I";
            "2" = "II";
            "3" = "III";
            "4" = "IV";
            "5" = "V";
            active = "";
            default = "";
          };
          on-click = "activate";
          persistent-workspaces = {
            "*" = 5;
          };
        };

        "hyprland/window" = {
          max-length = 35;
          separate-outputs = true;
          rewrite = {
            "" = "Desktop";
          };
        };

        clock = {
          format = "  {:%H:%M}";
          format-alt = "  {:%a %d %b}";
          tooltip-format = "<tt>{calendar}</tt>";
        };

        battery = {
          format = "{icon}  {capacity}%";
          format-charging = "  {capacity}%";
          format-plugged = "  {capacity}%";
          format-icons = [ "" "" "" "" "" ];
          states = {
            warning = 30;
            critical = 15;
          };
          tooltip-format = "{timeTo}";
        };

        network = {
          format-wifi = "  {essid}";
          format-ethernet = "  Wired";
          format-disconnected = "  Off";
          tooltip-format-wifi = "{essid} ({signalStrength}%)\n{ipaddr}/{cidr}";
          tooltip-format-ethernet = "{ifname}\n{ipaddr}/{cidr}";
          on-click = "nm-connection-editor";
        };

        bluetooth = {
          format = "";
          format-connected = "  {device_alias}";
          format-disabled = "";
          tooltip-format = "{controller_alias}\n{num_connections} connected";
          tooltip-format-connected = "{controller_alias}\n{device_enumerate}";
          tooltip-format-enumerate-connected = "{device_alias}\t{device_battery_percentage}%";
          on-click = "blueman-manager";
        };

        backlight = {
          format = "{icon}  {percent}%";
          format-icons = [ "" "" ];
          on-scroll-up = "brightnessctl set +5%";
          on-scroll-down = "brightnessctl set 5%-";
        };

        pulseaudio = {
          format = "{icon}  {volume}%";
          format-muted = "  Muted";
          format-icons = {
            default = [ "" "" "" ];
            headphone = "";
          };
          on-click = "pavucontrol";
          on-scroll-up = "wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+";
          on-scroll-down = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
        };

        tray = {
          icon-size = 14;
          spacing = 6;
        };
      };
    };

    # r/unixporn inspired floating pill-bar styling
    # Stylix injects @define-color base00..base0F; we reference those
    style = ''
      * {
        font-family: "JetBrains Mono Nerd Font", "JetBrains Mono", monospace;
        font-size: 13px;
        min-height: 0;
        padding: 0;
        margin: 0;
      }

      window#waybar {
        background: alpha(@theme_bg_color, 0.85);
        border-radius: 12px;
        border: 1px solid alpha(@theme_fg_color, 0.08);
      }

      /* --- Left modules --- */
      #workspaces {
        margin: 4px 4px 4px 6px;
        padding: 0;
      }

      #workspaces button {
        padding: 4px 8px;
        margin: 0 2px;
        border-radius: 8px;
        color: alpha(@theme_fg_color, 0.5);
        background: transparent;
        transition: all 0.2s ease;
      }

      #workspaces button.active {
        color: @theme_fg_color;
        background: alpha(@theme_fg_color, 0.12);
      }

      #workspaces button:hover {
        color: @theme_fg_color;
        background: alpha(@theme_fg_color, 0.08);
      }

      #window {
        margin: 4px;
        padding: 4px 12px;
        color: alpha(@theme_fg_color, 0.6);
      }

      /* --- Center --- */
      #clock {
        margin: 4px;
        padding: 4px 16px;
        border-radius: 8px;
        background: alpha(@theme_fg_color, 0.06);
        color: @theme_fg_color;
        font-weight: bold;
      }

      /* --- Right modules (pill-grouped) --- */
      #pulseaudio, #backlight, #network, #bluetooth, #battery, #tray {
        margin: 4px 2px;
        padding: 4px 10px;
        border-radius: 8px;
        color: @theme_fg_color;
        background: alpha(@theme_fg_color, 0.06);
        transition: all 0.2s ease;
      }

      #pulseaudio:hover, #backlight:hover, #network:hover, #bluetooth:hover, #battery:hover {
        background: alpha(@theme_fg_color, 0.12);
      }

      #battery.warning {
        color: @warning_color;
      }

      #battery.critical {
        color: @error_color;
        animation: blink 1s linear infinite;
      }

      #tray {
        margin-right: 6px;
      }

      @keyframes blink {
        to { color: @theme_fg_color; }
      }
    '';
  };
}
