{pkgs, ...}: {
  users.users = {
    linus = {
      uid = 1000;
      isNormalUser = true;
      description = "Linus";
      extraGroups = ["networkmanager" "wheel" "dialout" "input" "steamlib" "docker"];
      shell = pkgs.zsh;
      hashedPassword = "$y$j9T$srag6ljzYqotyjDHYkM2z1$7aev0Zk6CMQ4.RzQinU7Tppba2YfWp1dENbWr5NzfOB";
    };
  };

  users.groups = {
    steamlib.gid = 30003;
  };
}
