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
    
    lilith = {
      uid = 1002;
      isNormalUser = true;
      description = "Lilith";
      hashedPassword = "$6$vPlSsLC5e8ACQrII$.1R0K1LLkimRiheoOfAPwviai46iAoOszoEGMIY8CaII0NgT9UVJJu5t7lZSAmCbcSVI6vq8TzAn2xsN7oTB2.";
      extraGroups = ["networkmanager" "input" "steamlib"];
    };
  };

  users.groups = {
    robocup.gid = 30002;
    steamlib.gid = 30003;
  };
}
