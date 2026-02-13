{ config, pkgs, ... }:

{
  home.username = "ironman";
  home.homeDirectory = "/home/ironman";

  home.stateVersion = "25.11";

  programs.zsh.enable = true;
}
