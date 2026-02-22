{ ... }:

{
  imports = [
    ./packages.nix
    ./zsh.nix
    ./git.nix
    ./theme.nix
    ./kitty.nix
    ./hyprland.nix
    ./hyprland-binds.nix
    ./waybar.nix
    ./rofi.nix
  ];

  programs.home-manager.enable = true;

  home.username = "batman";
  home.homeDirectory = "/home/batman";
  home.stateVersion = "25.11";
}
