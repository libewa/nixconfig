{ pkgs, ... }:
{
  imports = [
    ./packages.nix
  ];
  nixpkgs.config = {
    allowUnfree = true;
  };
  boot.plymouth.enable = true;
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  security.polkit.enable = true;
  networking.hostName = "raspberrypi4";
  networking.networkmanager.enable = true;
  services.xserver.enable = true;
  services.gnome.gnome-keyring.enable = true;
  services.libinput.enable = true;
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
  };
  services.openssh = {
    enable = true;
    openFirewall = true;
    startWhenNeeded = true;
    settings = {
      X11Forwarding = true;
    };
  };
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 80 443 ];
    allowedUDPPorts = [];
    allowedTCPPortRanges = [ { from = 8080; to = 8090; } ];
    allowedUDPPortRanges = [];
  };
  
  system.stateVersion = "24.05";
}
