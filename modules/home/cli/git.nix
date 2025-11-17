{
  programs.git = {
    enable = true;
    includes = [
      {path = ./dotfiles/git/github.gitconfig;}
      {path = ./dotfiles/git/lfs.gitconfig;}
    ];
    settings = {
      user = {
        name = "Linus Warnatz";
        email = "linus@libewa.xyz";
        signingkey = "EBD029E073D2959A9DC1A74A7BCA3874C2A0475C";
      };
      pull.rebase = true;
      push.autoSetupRemote = true;
      commit.gpgsign = true;
      tag.gpgsign = true;
      init.defaultBranch = "main";
      safe.directory = "/etc/nixos";
      alias = {
        co = "checkout";
        adog = "log --all --decorate --oneline --graph";
        aa = "add .";
        s = "status";
      };
    };
  };
}
