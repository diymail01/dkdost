{ ... }:

{
  imports = [
    ./packages.nix
    ./zsh.nix
    ./git.nix
  ];

  home.username = "batman";
  home.homeDirectory = "/home/batman";
  home.stateVersion = "25.11";
}
