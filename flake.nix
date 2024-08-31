{
  description = "NixOS config flake";

  inputs = {
    nixos-boot.url = "github:Melkor333/nixos-boot";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    #cdpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    homeconfig.url = "github:libewa/home-manager";
    sddm-sugar-candy-nix = {
      url = "gitlab:Zhaith-Izaliel/sddm-sugar-candy-nix";
      # Optional, by default this flake follows nixpkgs-unstable.
      inputs.nixpkgs.follows = "nixpkgs";
    };
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

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
          ./modules/powerkey.nix
          ./modules/sddm.nix
          ./modules/hypr.nix
	  ./modules/disko.nix
          inputs.nixos-boot.nixosModules.default
          inputs.sddm-sugar-candy-nix.nixosModules.default
	  inputs.disko.nixosModules.default
          {
            nixpkgs = {
              overlays = [
                inputs.sddm-sugar-candy-nix.overlays.default
              ];
            };
          }
        ];
      };
      livecd = nixpkgs.lib.nixosSystem {
        system ="x86_64-linux";
        modules = [
          ({ pkgs, modulesPath, ... }: {
            imports = [ (modulesPath + "/installer/cd-dvd/installation-cd-graphical-calamares.nix") ];
            environment.systemPackages = [ pkgs.neovim ];
          })
          inputs.homeconfig.nixosModules.livecd
          ./hosts/livecd/configuration.nix
          ./modules/appimage.nix
          ./modules/audio.nix
          ./modules/essentialpkgs.nix
          ./modules/sddm.nix
        ];
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
