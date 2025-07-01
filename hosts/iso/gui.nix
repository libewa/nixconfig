{ pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    kitty
    libreoffice
    firefox-devedition
  ];
  fonts.packages = with pkgs; [
    cascadia-code
  ];
  programs.nm-applet.enable = true;
  services.displayManager.autoLogin = {
    enable = true;
    user = "nixos";
  };
}