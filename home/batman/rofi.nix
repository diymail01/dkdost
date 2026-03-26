{ pkgs, ... }:

{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi;

    extraConfig = {
      modi = "drun,run,window";
      show-icons = true;
      icon-theme = "Papirus-Dark";
      display-drun = "Apps";
      display-run = "Run";
      display-window = "Windows";
      drun-display-format = "{name}";
      terminal = "kitty";
    };
  };

  # Write rofi theme to config dir so it can @import pywal colors at runtime
  xdg.configFile."rofi/theme.rasi".text = ''
    /* Import pywal-generated accent colors (updated on every wallpaper switch) */
    @import "~/.cache/wal/colors-rofi-dark.rasi"

    * {
      font: "JetBrainsMono Nerd Font 12";
    }

    configuration {
      show-icons: true;
    }

    window {
      width: 50em;
      border-radius: 16px;
      padding: 20px;
      transparency: "real";
      background-color: @background;
      border: 2px;
      border-color: @lightbg;
    }

    mainbox {
      spacing: 16px;
      background-color: @background;
      children: [ inputbar, listview ];
    }

    inputbar {
      padding: 12px 16px;
      border-radius: 12px;
      background-color: @lightbg;
      text-color: @foreground;
      children: [ prompt, textbox-prompt-colon, entry ];
      spacing: 8px;
    }

    prompt {
      text-color: @active-foreground;
      background-color: transparent;
      font: "JetBrainsMono Nerd Font Bold 12";
    }

    textbox-prompt-colon {
      str: "";
      text-color: @active-foreground;
      background-color: transparent;
      expand: false;
    }

    entry {
      text-color: @foreground;
      background-color: transparent;
      placeholder: "Type to search...";
      placeholder-color: @lightfg;
    }

    listview {
      columns: 2;
      lines: 8;
      spacing: 6px;
      fixed-columns: true;
      scrollbar: false;
      background-color: transparent;
    }

    element {
      padding: 10px 14px;
      border-radius: 10px;
      background-color: transparent;
      text-color: @foreground;
      spacing: 10px;
    }

    element selected {
      background-color: @active-background;
      text-color: @foreground;
      border: 1px;
      border-color: @active-foreground;
      border-radius: 10px;
    }

    element-icon {
      size: 28px;
      border-radius: 6px;
      background-color: transparent;
    }

    element-text {
      vertical-align: 0.5;
      background-color: transparent;
    }
  '';

  # Point rofi to our theme file
  xdg.configFile."rofi/config.rasi".text = ''
    @theme "~/.config/rofi/theme.rasi"
  '';
}
