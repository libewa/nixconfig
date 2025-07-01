{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    pv
    efibootmgr
    udiskie

    bluez-tools

    (writeShellScriptBin "install-os" ''
      #!/bin/sh
      echo "Installing config $1 to $2"
      nix run 'github:nix-community/disko/latest#disko-install' -- --flake github:libewa/nixconfig#"$1" --disk sda "$2"
    '')
  ];

  hardware.graphics.enable32Bit = true;

  services.blueman.enable = true;
}
