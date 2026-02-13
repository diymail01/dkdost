{ config, pkgs, ... }:

{
  home.username = "omniman";
  home.homeDirectory = "/home/omniman";

  home.stateVersion = "25.11";

  programs.zsh.enable = true;
}
