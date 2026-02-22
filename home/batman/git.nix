{
  programs.git = {
    enable = true;
    settings.user.name = "diymail01";
    settings.user.email = "diymail01@gmail.com";
  };

  programs.ssh = {
    enable = true;
    matchBlocks = {
      "github.com" = {
        user = "git";
        identityFile = "~/.ssh/id_ed25519";
      };
    };
  };
}
