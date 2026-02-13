{
  programs.git = {
    enable = true;
    userName = "diymail01";
    userEmail = "diymail01@gmail.com";
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
