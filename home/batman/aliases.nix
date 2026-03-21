{
  home.shellAliases = {
    ll = "eza -la --icons --group-directories-first";
    ls = "eza --icons --group-directories-first";
    lt = "eza --tree --icons --level=2";
    cat = "bat --style=auto";
    rebuild = "sudo nixos-rebuild switch --flake ~/nixos-config#user0";
    update = "nix flake update --flake ~/nixos-config";
    upgrade = "nix flake update --flake ~/nixos-config && sudo nixos-rebuild switch --flake ~/nixos-config#user0";
    gc = "sudo nix-collect-garbage -d && nix-collect-garbage -d";
  };
}
