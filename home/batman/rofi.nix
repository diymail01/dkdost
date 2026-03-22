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

    # Modern fullscreen-lite theme with glassmorphism
    theme = let
      inherit (builtins) toString;
    in builtins.toFile "rofi-theme.rasi" ''
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
        background-color: #1a1a2eaa;
        border: 2px;
        border-color: #ffffff20;
      }

      mainbox {
        spacing: 16px;
        children: [ inputbar, listview ];
      }

      inputbar {
        padding: 12px 16px;
        border-radius: 12px;
        background-color: #ffffff0a;
        text-color: #e0e0e0;
        children: [ prompt, textbox-prompt-colon, entry ];
        spacing: 8px;
      }

      prompt {
        text-color: #7aa2f7;
        font: "JetBrainsMono Nerd Font Bold 12";
      }

      textbox-prompt-colon {
        str: "";
        text-color: #7aa2f7;
        expand: false;
      }

      entry {
        text-color: #e0e0e0;
        placeholder: "Type to search...";
        placeholder-color: #666680;
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
        text-color: #c0c0d0;
        spacing: 10px;
      }

      element selected {
        background-color: #7aa2f720;
        text-color: #e0e0e0;
        border: 1px;
        border-color: #7aa2f760;
        border-radius: 10px;
      }

      element-icon {
        size: 28px;
        border-radius: 6px;
      }

      element-text {
        vertical-align: 0.5;
      }
    '';
  };
}
