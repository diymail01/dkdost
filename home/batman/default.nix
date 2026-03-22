{ ... }:

{
  imports = [
    # --- Core ---
    ./packages.nix
    ./aliases.nix
    ./scripts.nix
    ./git.nix

    # --- Shell ---
    ./zsh.nix

    # --- Desktop ---
    ./theme.nix
    ./hyprland.nix
    ./hyprland-binds.nix
    ./hyprlock.nix
    ./waybar.nix
    ./rofi.nix
    ./swaync.nix
    ./hypridle.nix
    ./gtk.nix

    # --- Terminal ---
    ./kitty.nix
  ];

  programs.home-manager.enable = true;

  home.username = "batman";
  home.homeDirectory = "/home/batman";
  home.stateVersion = "25.11";
}
