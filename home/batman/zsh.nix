{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

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
