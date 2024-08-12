{
  description = "NixOS config flake";

  inputs = {
    nixos-boot.url = "github:Melkor333/nixos-boot";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    #cdpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    livecdhome.url = "github:libewa/home-manager";
    sddm-sugar-candy-nix = {
      url = "gitlab:Zhaith-Izaliel/sddm-sugar-candy-nix";
      # Optional, by default this flake follows nixpkgs-unstable.
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    nixos-generators = {
      url = "github:nix-community/nixos-generators";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, /*cdpkgs,*/ nixos-generators, ... }@inputs: {
    nixosConfigurations = {
      yoga = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs; };
        modules = [
          ./hosts/yoga/configuration.nix

          ./modules/grub.nix
          ./hardware-configuration.nix
          ./modules/appimage.nix
          ./modules/audio.nix
          ./modules/germanlocale.nix
          ./modules/essentialpkgs.nix
          ./modules/sunshine.nix
          ./modules/gnomeapps.nix
          ./modules/powerkey.nix
          ./modules/sddm.nix
          ./modules/hypr.nix
          inputs.nixos-boot.nixosModules.default
          inputs.sddm-sugar-candy-nix.nixosModules.default
          {
            nixpkgs = {
              overlays = [
                inputs.sddm-sugar-candy-nix.overlays.default
              ];
            };
          }
        ];
      };
      raspberrypi4 = nixpkgs.lib.nixosSystem {
        modules = [
	  ./hosts/raspberrypi4/configuration.nix

	  ./modules/appimage.nix
	  ./modules/audio.nix
	  ./modules/germanlocale.nix
	  ./modules/grub.nix
	  ./modules/essentialpkgs.nix
	  ./modules/sddm.nix
	  ./modules/hypr.nix
	  inputs.nixos-boot.nixosModules.default
	  inputs.sddm-sugar-candy-nix.nixosModules.default
	  { nixpkgs.overlays = [ inputs.sddm-sugar-candy-nix.overlays.default ]; }
	];
	specialArgs = { inherit inputs; };
      };
    };
    packages.x86_64-linux = {
      /*livecd = nixos-generators.nixosGenerate {
        system = "x86_64-linux";
        modules = [
          ./hosts/livecd/configuration.nix

          ./modules/appimage.nix
          ./modules/audio.nix
          ./modules/essentialpkgs.nix
          ./modules/sddm.nix

          "${inputs.nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix"
          "${inputs.nixpkgs}/nixos/modules/installer/cd-dvd/channel.nix"
          inputs.livecdhome.nixosModules.default
        ];
        #pkgs = cdpkgs.legacyPackages.x86_64-linux;
        format = "iso";
      };
      livecd-de = nixos-generators.nixosGenerate {
        system = "x86_64-linux";
        modules = [
          ./hosts/livecd/configuration.nix
          ./modules/appimage.nix
          ./modules/audio.nix
          ./modules/essentialpkgs.nix
          ./modules/sddm.nix

          ./modules/germanlocale.nix

          "${inputs.nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix"
          "${inputs.nixpkgs}/nixos/modules/installer/cd-dvd/channel.nix"

          inputs.livecdhome.nixosModules.default
        ];
        #pkgs = cdpkgs.legacyPackages.x86_64-linux;
        format = "iso";
      };*/
      raspberrypi4 = nixos-generators.nixosGenerate {
        system = "aarch64";
	format = "sd-aarch64";
	modules = self.nixosConfigurations.raspberrypi4.modules;
      };
    };
    nixosModules = {
      sddm = {
        imports = [
          ./modules/sddm.nix
        ];
      };
      grub = {
        imports = [
          ./modules/grub.nix
        ];
      };
    };
  };
}
