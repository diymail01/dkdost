{ pkgs, ... }:

{
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  home.packages = with pkgs; [
    git
    bat
    btop
    ripgrep
    fd
  ];
}
