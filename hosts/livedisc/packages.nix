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
  ];
  hardware.opengl.driSupport32Bit = true;
  programs.hyprland.enable = true;
}

