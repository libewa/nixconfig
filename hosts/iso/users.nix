{pkgs, ...}: {
  users.users = {
    nixos = {
      uid = 1000;
      isNormalUser = true;
      shell = pkgs.zsh;
      hashedPassword = "";
    };
  };
}
