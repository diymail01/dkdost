{ config, pkgs, ... }:

{
  home.username = "batman";
  home.homeDirectory = "/home/batman";

  home.stateVersion = "25.11";

  programs.zsh.enable = true;
}
