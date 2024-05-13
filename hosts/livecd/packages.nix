{ pkgs, ... }:

{
  virtualisation.virtualbox.guest.enable = true;
  environment.systemPackages = with pkgs; [
    vscodium
    firefox
    pv
    efibootmgr

    kitty
    hyprnome
    gnome.nautilus
    hyprlock
    hypridle
    swayosd
    swaynotificationcenter
    udiskie
    notify-desktop
    rofi-power-menu
  ];
  hardware.opengl.driSupport32Bit = true;
  programs.hyprland.enable = true;
}

