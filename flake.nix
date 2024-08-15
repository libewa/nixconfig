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
    home-manager = {
      url = "github:libewa/home-manager-1/zed-editor";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { nixpkgs, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
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
    homeConfigurations = {
        "linus" = inputs.home-manager.lib.homeManagerConfiguration {
          inherit pkgs;

          # Specify your home configuration modules here, for example,
          # the path to your home.nix.
          modules = [
            ./home.nix
            ./guionly.nix
            ./modules/hyprland.nix
            ./modules/waybar.nix
            ./modules/nvim
            ./modules/zsh.nix
            ./modules/vscode.nix
	    ./modules/zed.nix
	    ./modules/rofi.nix
	    ./modules/yt-dlp.nix
	    ./modules/git.nix
            {
              # Home Manager needs a bit of information about you and the paths it should
              # manage.
              home.username = "linus";
              home.homeDirectory = "/home/linus";
            }
          ];

          # Optionally use extraSpecialArgs
          # to pass through arguments to home.nix
        };
        nixos = inputs.home-manager.lib.homeManagerConfiguration {
          inherit pkgs;

          modules = [ ./home.nix {
            # Home Manager needs a bit of information about you and the paths it should
            # manage.
            home.username = "nixos";
            home.homeDirectory = "/home/nixos";
          }];
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
