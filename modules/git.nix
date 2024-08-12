{
  programs.git = {
    enable = true;
    aliases = {
      co = "checkout";
      adog = "log --all --decorate --oneline --graph";
    };
    includes = [
      { path = ./../dotfiles/git/github.gitconfig; }
      { path = ./../dotfiles/git/lfs.gitconfig; }
    ];
    extraConfig = {
      user = {
        name = "libewa";
	email = "libewa.git@icloud.com";
	signingkey = "/home/linus/.ssh/id_ed25519.pub";
      };
      pull.rebase = true;
      gpg.format = "ssh";
      commit.gpgsign = true;
      init.defaultBranch = "main";
      safe.directory = "/etc/nixos";
    };
  };
}
