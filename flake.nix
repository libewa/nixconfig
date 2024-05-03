{
  description = "NixOS config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations.yoga = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        ./hosts/yoga/configuration.nix
        ./modules/grub.nix
        ./hardware-configuration.nix
        ./modules/appimage.nix
        ./modules/audio.nix
        ./modules/germanlocale.nix
        ./modules/essentialpkgs.nix
        inputs.home-manager.nixosModules.default
      ];
    };
  };
}
