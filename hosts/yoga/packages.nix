{pkgs, ...}: {
  virtualisation.libvirtd.enable = true;
  virtualisation.virtualbox.host.enable = true;
  programs.dconf.enable = true; # virt-manager requires dconf to remember settings
  environment.systemPackages = with pkgs; [
    virt-manager
    vscodium
    firefox
    pv
    efibootmgr
    udiskie
    kitty
    libreoffice
    wvkbd
    bottles

    bluez-tools
  ];
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  };
  programs.nh = {
    enable = true;
    clean.enable = true;
    flake = "/home/linus/nixconfig";
  };
  hardware.graphics.enable32Bit = true;
  programs.hyprland.enable = true;
  programs.nm-applet.enable = true;
  services.blueman.enable = true;
}
