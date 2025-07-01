{pkgs, ...}: {
  virtualisation.libvirtd.enable = true;
  virtualisation.virtualbox.host.enable = false;
  programs.dconf.enable = true; # virt-manager requires dconf to remember settings
  environment.systemPackages = with pkgs; [
    virt-manager
    firefox-devedition
    pv
    efibootmgr
    udiskie
    kitty
    libreoffice
    wvkbd
    bottles

    bluez-tools

    (writeShellScriptBin "install-os" ''
      #!/bin/sh
      echo "Installing OS..."
      nix run 'github:nix-community/disko/latest#disko-install' -- --flake github:libewa/nixconfig#yoga --disk sda /dev/sda
    '')
  ];

  hardware.graphics.enable32Bit = true;

  programs.nm-applet.enable = true;
  services.blueman.enable = true;
  fonts.packages = with pkgs; [
    cascadia-code
  ];
}
