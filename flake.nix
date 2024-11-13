{
  description = "NixOS config flake";

  inputs = {
    nixos-boot.url = "github:Melkor333/nixos-boot";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
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
    home-manager = {
      url = "github:libewa/home-manager-1/zed-editor";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    activate-linux.url = "github:mrglockenspiel/activate-linux";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    activate-linux,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    nixosConfigurations = {
      yoga = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/yoga/configuration.nix
          ./hardware-configuration.nix
          ./modules/system/core.nix

          ./modules/system/grub.nix
          ./modules/system/appimage.nix
          ./modules/system/backup.nix
          ./modules/system/germanlocale.nix
          ./modules/system/powerkey.nix
          ./modules/system/disko.nix
          ./modules/system/firewall.nix
          
          ./modules/system/gui/sddm.nix
          ./modules/system/gui/audio.nix
          ./modules/system/gui/sunshine.nix
          ./modules/system/gui/hypr.nix
          ./modules/system/gui/steamdeck.nix
          inputs.nixos-boot.nixosModules.default
          inputs.sddm-sugar-candy-nix.nixosModules.default
          inputs.disko.nixosModules.default
          {
            nixpkgs.overlays = [
                inputs.sddm-sugar-candy-nix.overlays.default
              ];
          }
        ];
      };
      wsl = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/wsl/configuration.nix
          ./modules/system/core.nix
          ./modules/system/appimage.nix
          ./modules/system/germanlocale.nix
          ./modules/system/firewall.nix
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
        extraSpecialArgs = {inherit activate-linux;};

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
    formatter.${system} = nixpkgs.legacyPackages.${system}.alejandra;
  };
}
