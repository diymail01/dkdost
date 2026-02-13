{ pkgs, ... }:

{
  home.packages = with pkgs; [
    git
    bat
    btop
    ripgrep
    fd
  ];
}
