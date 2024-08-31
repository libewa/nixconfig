{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vscodium
    firefox
    pv
    efibootmgr

    kitty
    hyprnome
    hyprlock
    hypridle
    swayosd
    swaynotificationcenter
    udiskie
    notify-desktop
    rofi-power-menu
  ];
  hardware.opengl.driSupport32Bit = true;
}

