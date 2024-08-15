{ pkgs, ...}:

{
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub = {
    enable = true;
    device = "nodev";
    efiSupport = true;
    #useOSProber = true;
    timeoutStyle = "hidden";
    memtest86.enable = true;
    extraEntries = ''
    menuentry 'UEFI Firmware Settings' $menuentry_id_option 'uefi-firmware' {
    	fwsetup
    }
    '';
    theme = pkgs.stdenv.mkDerivation {
      pname = "grub_bios_theme";
      version = "1.0";
      src = pkgs.fetchFromGitHub {
        owner = "Blaysht";
	repo = "grub_bios_theme";
	rev = "Releases";
	hash = "sha256-kYcEMCV9ipwPGgfAwOtFgYO4eHZxkUS97tOr0ft4rUE=";
      };
      installPhase = "cp -r OldBIOS/ $out";
    };
  };
}
