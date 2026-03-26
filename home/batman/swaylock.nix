{ pkgs, lib, ... }:

{
  # Disable Stylix's targets to avoid conflicts
  stylix.targets.hyprlock.enable = lib.mkForce false;
  stylix.targets.swaylock.enable = lib.mkForce false;

  # Disable hyprlock entirely
  programs.hyprlock.enable = lib.mkForce false;

  # Swaylock-effects configuration
  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock-effects;

    settings = {
      # --- Screenshot + blur ---
      screenshots = true;
      clock = true;
      indicator = true;
      indicator-radius = 120;
      indicator-thickness = 8;

      # --- Blur ---
      effect-blur = "12x5";
      effect-vignette = "0.5:0.5";

      # --- Colors (Tokyo Night inspired) ---
      inside-color = "00000000";
      inside-clear-color = "00000000";
      inside-ver-color = "7aa2f740";
      inside-wrong-color = "ff555540";

      ring-color = "ffffff30";
      ring-clear-color = "7aa2f7aa";
      ring-ver-color = "7aa2f7ff";
      ring-wrong-color = "ff5555ff";

      line-color = "00000000";
      line-clear-color = "00000000";
      line-ver-color = "00000000";
      line-wrong-color = "00000000";

      separator-color = "00000000";

      key-hl-color = "7aa2f7ff";
      bs-hl-color = "ff5555ff";

      text-color = "ffffffee";
      text-clear-color = "ffffffee";
      text-ver-color = "ffffffee";
      text-wrong-color = "ff5555ee";

      # --- Layout ---
      font = "JetBrains Mono";
      font-size = 18;
      timestr = "%H:%M";
      datestr = "%A, %d %B";

      # --- Behavior ---
      fade-in = 0.3;
      grace = 3;
      ignore-empty-password = true;
      show-failed-attempts = true;
    };
  };
}
