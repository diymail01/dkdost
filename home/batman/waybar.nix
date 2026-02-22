{ pkgs, lib, ... }:

{
  programs.waybar = {
    enable = true;

    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 34;
        spacing = 8;

        modules-left = [ "hyprland/workspaces" "hyprland/window" ];
        modules-center = [ "clock" ];
        modules-right = [ "pulseaudio" "network" "cpu" "memory" "battery" "tray" ];

        "hyprland/workspaces" = {
          format = "{icon}";
          format-icons = {
            "1" = "一";
            "2" = "二";
            "3" = "三";
            "4" = "四";
            "5" = "五";
          };
          on-click = "activate";
        };

        "hyprland/window" = {
          max-length = 40;
          separate-outputs = true;
        };

        clock = {
          format = " {:%H:%M}";
          format-alt = " {:%A, %d %B %Y}";
          tooltip-format = "<tt>{calendar}</tt>";
        };

        cpu = {
          format = " {usage}%";
          interval = 5;
        };

        memory = {
          format = " {percentage}%";
          interval = 5;
        };

        battery = {
          format = "{icon} {capacity}%";
          format-icons = [ "" "" "" "" "" ];
          format-charging = " {capacity}%";
          states = {
            warning = 30;
            critical = 15;
          };
        };

        network = {
          format-wifi = " {signalStrength}%";
          format-ethernet = " {ipaddr}";
          format-disconnected = "⚠ Offline";
          tooltip-format = "{ifname}: {ipaddr}/{cidr}";
        };

        pulseaudio = {
          format = "{icon} {volume}%";
          format-muted = " Mute";
          format-icons = {
            default = [ "" "" "" ];
          };
          on-click = "pavucontrol";
        };

        tray = {
          icon-size = 16;
          spacing = 8;
        };
      };
    };

    # Stylix auto-injects colors; this adds layout/spacing
    style = ''
      * {
        font-family: "JetBrains Mono";
        font-size: 13px;
        min-height: 0;
      }

      window#waybar {
        border-radius: 0;
      }

      #workspaces button {
        padding: 0 6px;
        border-radius: 4px;
      }

      #clock, #cpu, #memory, #battery, #network, #pulseaudio, #tray {
        padding: 0 10px;
        border-radius: 4px;
      }
    '';
  };
}
