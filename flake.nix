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
    nixos-wsl.url = "https://github.com/nix-community/NixOS-WSL/archive/refs/heads/main.tar.gz";
    nixos-generators = {
      url = "github:nix-community/nixos-generators";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:libewa/home-manager-1/zed-editor";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    activate-linux.url = "github:mrglockenspiel/activate-linux";
  };

  outputs =
    {
      self,
      nixpkgs, # cdpkgs,
      nixos-generators,
      nixos-wsl,
      home-manager,
      activate-linux,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      nixosConfigurations = {
        yoga = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/yoga/configuration.nix

            ./modules/system/grub.nix
            ./hardware-configuration.nix
            ./modules/system/appimage.nix
            ./modules/system/audio.nix
            ./modules/system/backup.nix
            ./modules/system/germanlocale.nix
            ./modules/system/essentialpkgs.nix
            ./modules/system/sunshine.nix
            ./modules/system/powerkey.nix
            ./modules/system/sddm.nix
            ./modules/system/hypr.nix
            ./modules/system/disko.nix
            ./modules/system/steamdeck.nix
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
        wsl = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/wsl/configuration.nix
            ./modules/system/essentialpkgs.nix
            ./modules/system/appimage.nix
            ./modules/system/germanlocale.nix
            inputs.nixos-wsl.nixosModules.wsl
          ];
        };
      };
      homeConfigurations = {
        "linus" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;

          # Specify your home configuration modules here, for example,
          # the path to your home.nix.
          modules = [
            ./home.nix
            ./modules/home/gui
            ./modules/home/cli
            {
              # Home Manager needs a bit of information about you and the paths it should
              # manage.
              home.username = "linus";
              home.homeDirectory = "/home/linus";
            }
          ];
          extraSpecialArgs = { inherit activate-linux; };

          # Optionally use extraSpecialArgs
          # to pass through arguments to home.nix
        };
        nixos = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;

          modules = [
            ./home.nix
            ./modules/home/cli
            {
              # Home Manager needs a bit of information about you and the paths it should
              # manage.
              home.username = "nixos";
              home.homeDirectory = "/home/nixos";
            }
          ];
        };
      };
      nixosModules = {
        livecd =
        { inputs, ... }:
        {
          imports = [
            inputs.home-manager.nixosModules.home-manager
          ];
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.nixos = {
            imports = [
              ./home.nix
              ./modules/home/cli
              ./modules/home/gui
              {
                home.username = "nixos";
                home.homeDirectory = "/home/nixos";
              }
            ];
          };

          # Optionally, use home-manager.extraSpecialArgs to pass
          # arguments to home.nix
        };
        sddm = {
          imports = [
            ./modules/system/sddm.nix
          ];
        };
        grub = {
          imports = [
            ./modules/system/grub.nix
          ];
        };
      };
      /*
      packages.x86_64-linux = {
        livecd = nixos-generators.nixosGenerate {
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
        };
      };
      */
    };
}