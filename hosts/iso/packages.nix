{pkgs, ...}: {
  virtualisation.libvirtd.enable = true;
  virtualisation.virtualbox.host.enable = false;
  programs.dconf.enable = true; # virt-manager requires dconf to remember settings
  environment.systemPackages = with pkgs; [
    virt-manager
    vscodium
    firefox-devedition
    pv
    efibootmgr
    udiskie
    kitty
    libreoffice
    wvkbd
    bottles

    bluez-tools
  ];

  hardware.graphics.enable32Bit = true;

  programs.nm-applet.enable = true;
  services.blueman.enable = true;
  fonts.packages = with pkgs; [
    cascadia-code
  ];
}
