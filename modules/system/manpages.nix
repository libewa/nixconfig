{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    man-pages
    man-pages-posix
    linux-manual
  ];
  documentation = {
    enable = true; # install manpages for environment.systemPackages
    nixos.enable = true;
    man.enable = true;
    dev.enable = true;
  };
}
