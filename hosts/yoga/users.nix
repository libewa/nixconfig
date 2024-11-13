{pkgs, ...}: {
  users.users = {
    linus = {
      uid = 1000;
      isNormalUser = true;
      description = "Linus";
      extraGroups = ["networkmanager" "wheel" "dialout" "input" "robocup" "steamlib" "docker"];
      shell = pkgs.zsh;
      hashedPassword = "$y$j9T$srag6ljzYqotyjDHYkM2z1$7aev0Zk6CMQ4.RzQinU7Tppba2YfWp1dENbWr5NzfOB";
    };

    benjamin = {
      uid = 1001;
      isNormalUser = true;
      description = "Benjamin";
      extraGroups = ["networkmanager" "dialout" "input" "robocup"];
    };

    lilith = {
      uid = 1002;
      isNormalUser = true;
      description = "Lilith";
      hashedPassword = "$6$vPlSsLC5e8ACQrII$.1R0K1LLkimRiheoOfAPwviai46iAoOszoEGMIY8CaII0NgT9UVJJu5t7lZSAmCbcSVI6vq8TzAn2xsN7oTB2.";
      extraGroups = ["networkmanager" "input" "steamlib"];
    };

    mwarn = {
      uid = 1003;
      isNormalUser = true;
      description = "Michelle";
      extraGroups = ["networkmanager" "input" "wheel" "steamlib"];
      hashedPassword = "$y$j9T$BcqIHFh.ArjN9hHp0TOr0.$KsIwEXr9tU.7UBuwWOTtANg9NSuxNFbnsoXtd6MS8v1";
    };
  };

  users.groups = {
    robocup.gid = 30002;
    steamlib.gid = 30003;
  };
}
