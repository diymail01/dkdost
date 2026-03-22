{ pkgs, ... }:

{
  # SwayNC — macOS-style notification center
  # Replaces dunst with a slide-out panel (toggle with SUPER + N)
  services.swaync = {
    enable = true;

    settings = {
      positionX = "right";
      positionY = "top";
      layer = "overlay";
      control-center-layer = "top";
      layer-shell = true;
      cssPriority = "application";
      control-center-margin-top = 8;
      control-center-margin-bottom = 8;
      control-center-margin-right = 8;
      control-center-width = 400;
      notification-icon-size = 48;
      notification-body-image-height = 80;
      notification-body-image-width = 200;
      timeout = 8;
      timeout-low = 4;
      timeout-critical = 0;
      fit-to-screen = true;
      notification-window-width = 350;
      keyboard-shortcuts = true;
      image-visibility = "when-available";
      transition-time = 200;

      widgets = [
        "inhibitors"
        "title"
        "dnd"
        "notifications"
      ];

      widget-config = {
        inhibitors = {
          text = "Inhibitors";
          button-text = "Clear";
          clear-all-button = true;
        };
        title = {
          text = "Notifications";
          clear-all-button = true;
          button-text = "Clear All";
        };
        dnd = {
          text = "Do Not Disturb";
        };
      };
    };

    style = ''
      .control-center {
        background: alpha(@theme_bg_color, 0.92);
        border-radius: 12px;
        border: 1px solid alpha(@theme_fg_color, 0.08);
        padding: 12px;
      }

      .notification-row {
        outline: none;
      }

      .notification {
        border-radius: 10px;
        margin: 4px 0;
        padding: 0;
        background: alpha(@theme_bg_color, 0.6);
        border: 1px solid alpha(@theme_fg_color, 0.06);
      }

      .notification-content {
        padding: 8px;
      }

      .close-button {
        border-radius: 6px;
        background: alpha(@error_color, 0.2);
        color: @error_color;
        margin: 4px;
        padding: 2px 6px;
      }

      .widget-title {
        font-size: 16px;
        font-weight: bold;
        margin: 4px 0;
        color: @theme_fg_color;
      }

      .widget-title button {
        border-radius: 8px;
        background: alpha(@theme_fg_color, 0.08);
        color: @theme_fg_color;
        padding: 4px 10px;
      }

      .widget-dnd {
        margin: 4px 0;
        padding: 4px 8px;
        border-radius: 8px;
        background: alpha(@theme_fg_color, 0.04);
        color: @theme_fg_color;
      }

      .widget-dnd > switch {
        border-radius: 8px;
      }

      .widget-dnd > switch:checked {
        background: @theme_selected_bg_color;
      }
    '';
  };
}
