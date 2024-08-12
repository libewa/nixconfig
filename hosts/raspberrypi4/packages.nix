{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    vscodium
    firefox
    udiskie
    kitty
    libreoffice
    nerdfonts
    bluez-tools
  ];
  programs.nh = {
    enable = true;
    clean.enable = true;
    flake = /home/linus/nixconfig;
  };
  programs.hyprland.enable = true;
  programs.nm-applet.enable = true;
}
