{ pkgs, ... }:

{
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  home.packages = with pkgs; [
    bat
    btop
    ripgrep
    fd
    gnomeExtensions.user-themes
  ];
}
