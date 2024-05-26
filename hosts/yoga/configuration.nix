# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs, ... }:

{
  imports =
    [
      ./packages.nix
      ./users.nix
    ];
  nixpkgs.config = {
    # Allow proprietary packages
    allowUnfree = true;

    # Create an alias for the unstable channel
    #packageOverrides = pkgs: {
    #  unstable = import <nixos-unstable> { # pass the nixpkgs config to the unstable alias # to ensure `allowUnfree = true;` is propagated:
    #    config = config.nixpkgs.config;
    #  };
    #};
  };

  system.autoUpgrade.enable = true;
  security.sudo.extraRules = [{
    commands = [
      {
        command = "${pkgs.systemd}/bin/reboot";
        options = [ "NOPASSWD" ];
      }
    ];
  }];

  boot.plymouth.enable = true;

  services.flatpak.enable = true;
  nix.settings.experimental-features = [ "nix-command" "flakes"];

  networking.hostName = "yoga"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  services.logind.powerKey = "ignore";
  services.logind.powerKeyLongPress = "poweroff";
  systemd.sleep.extraConfig = ''
  HibernateDelaySec=10m
  SuspendState=mem
  '';

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput.enable = true;
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland pkgs.xdg-desktop-portal-gtk ];
  };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh = {
    enable = true;
    startWhenNeeded = true;
  }; 
  # Open ports in the firewall.
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 80 443 ];
    allowedUDPPorts = [];
    allowedTCPPortRanges = [
      # { from = 8080; to = 8090 };
    ];
    allowedUDPPortRanges = [
      # as above
    ];
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?
}
