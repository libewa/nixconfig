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
          ./system/hosts/yoga/configuration.nix

          ./system/hardware-configuration.nix
          ./system/modules/grub.nix
          ./system/modules/appimage.nix
          ./system/modules/audio.nix
          ./system/modules/germanlocale.nix
          ./system/modules/essentialpkgs.nix
          ./system/modules/sunshine.nix
          ./system/modules/powerkey.nix
          ./system/modules/sddm.nix
          ./system/modules/hypr.nix
          ./system/modules/disko.nix
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
    };
    nixosModules = {
      sddm = {
        imports = [
          ./system/modules/sddm.nix
        ];
      };
      grub = {
        imports = [
          ./system/modules/grub.nix
        ];
      };
    };
  };
}
