{pkgs, ...}: {
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.timeout = 2;
  boot.loader.grub = {
    enable = true;
    devices = [ "nodev" ];
    efiSupport = true;
    #useOSProber = true;
    timeoutStyle = "menu";
    extraEntries = ''
      menuentry 'UEFI Firmware Settings' $menuentry_id_option 'uefi-firmware' --class efi {
        fwsetup
      }
      menuentry "Memtest86+" --class memtest {
        linux ($drive1)//memtest.bin
      }
    '';
    theme = pkgs.stdenv.mkDerivation {
      pname = "grub_nixos_theme";
      version = "1.0";
      src = pkgs.fetchzip {
        url = "https://github.com/AdisonCavani/distro-grub-themes/releases/download/v3.2/nixos.tar";
        hash = "sha256-KQAXNK6sWnUVwOvYzVfolYlEtzFobL2wmDvO8iESUYE=";
        stripRoot = false;
      };
      installPhase = "cp -r . $out";
    };
  };
}
