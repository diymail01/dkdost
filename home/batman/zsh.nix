{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ll = "eza -la --icons --group-directories-first";
      ls = "eza --icons --group-directories-first";
      lt = "eza --tree --icons --level=2";
      cat = "bat --style=auto";
      rebuild = "sudo nixos-rebuild switch --flake ~/nixos-config#user0";
      update = "nix flake update --flake ~/nixos-config";
      gc = "sudo nix-collect-garbage -d && nix-collect-garbage -d";
    };

    history = {
      size = 10000;
      save = 10000;
      ignoreAllDups = true;
      ignoreDups = true;
      share = true;
    };

    initContent = ''
      export PATH="$HOME/.local/bin:$PATH"
    '';
  };
}
