{
  description = "NixOS config flake";

  inputs = {
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
    nixos-wsl = {
      url = "https://github.com/nix-community/NixOS-WSL/archive/refs/heads/main.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-hardware.url = "github:nixos/nixos-hardware";
    nixvim = {
        url = "github:nix-community/nixvim";
        # If using a stable channel you can use `url = "github:nix-community/nixvim/nixos-<version>"`
        inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    nixos-hardware,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    packages.x86_64-linux = {
      iso-gui = self.nixosConfigurations.iso-gui.config.system.build.isoImage;
      iso-term = self.nixosConfigurations.iso-term.config.system.build.isoImage;
    };
    nixosConfigurations = {
      yoga = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/yoga/configuration.nix
          ./hardware-configuration.nix
          ./modules/system/core.nix

          ./modules/system/grub.nix
          ./modules/system/appimage.nix
          ./modules/system/locale.nix
          ./modules/system/powerkey.nix
          ./modules/system/disko.nix
          ./modules/system/firewall.nix

          ./modules/system/gui/sddm.nix
          ./modules/system/gui/audio.nix
          ./modules/system/gui/hypr.nix
          inputs.sddm-sugar-candy-nix.nixosModules.default
          inputs.disko.nixosModules.default
          {
            nixpkgs.overlays = [
              inputs.sddm-sugar-candy-nix.overlays.default
            ];
          }
        ];
      };
      nixmac = nixpkgs.lib.nixosSystem {
        modules = [
          ./hosts/nixmac/configuration.nix

          nixos-hardware.nixosModules.apple-t2
          ./modules/system/t2cache.nix
          ./modules/system/core.nix
          ./modules/system/grub.nix

          ./modules/system/appimage.nix
          ./modules/system/locale.nix
          ./modules/system/powerkey.nix
          ./modules/system/disko.nix
          ./modules/system/firewall.nix

          ./modules/system/gui/sddm.nix
          ./modules/system/gui/audio.nix
          ./modules/system/gui/hypr.nix
          inputs.sddm-sugar-candy-nix.nixosModules.default
          inputs.disko.nixosModules.default
          {
            nixpkgs.overlays = [
              inputs.sddm-sugar-candy-nix.overlays.default
            ];
            nixpkgs.hostPlatform = "x86_64-linux";
          }
        ];
      };
      wsl = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/wsl/configuration.nix
          ./modules/system/core.nix
          ./modules/system/appimage.nix
          ./modules/system/locale.nix
          ./modules/system/firewall.nix
          inputs.nixos-wsl.nixosModules.wsl
        ];
      };
      iso-gui = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ({
            pkgs,
            modulesPath,
            ...
          }: {
            imports = [(modulesPath + "/installer/cd-dvd/installation-cd-graphical-base.nix")];
          })
          ./modules/system/locale.nix
          ./modules/system/gui/hypr.nix
          ./modules/system/core.nix
          ./modules/system/gui/sddm.nix

          ./hosts/iso/configuration.nix
          ./hosts/iso/gui.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.nixos = {
              imports = [
                ./home.nix
                ./modules/home/gui/hypr
                ./modules/home/gui/rofi.nix
                ./modules/home/gui/waybar.nix
                ./modules/home/gui/zed.nix
                ./modules/home/gui/cursor.nix

                ./modules/home/cli/git.nix
                ./modules/home/cli/zsh.nix
                ./modules/home/cli/helix.nix
                ./modules/home/cli/fetch.nix
              ];
              home.username = "nixos";
              home.homeDirectory = "/home/nixos";
            };
            # Optionally, use home-manager.extraSpecialArgs to pass
            # arguments to home.nix
          }
          inputs.sddm-sugar-candy-nix.nixosModules.default
          {
            nixpkgs.overlays = [
              inputs.sddm-sugar-candy-nix.overlays.default
            ];
          }
        ];
      };
      iso-term = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ({
            pkgs,
            modulesPath,
            ...
          }: {
            imports = [(modulesPath + "/installer/cd-dvd/installation-cd-graphical-base.nix")];
          })
          ./modules/system/locale.nix
          ./modules/system/core.nix

          ./hosts/iso/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.nixos = {
              imports = [
                ./home.nix
                ./modules/home/cli/git.nix
                ./modules/home/cli/zsh.nix
                ./modules/home/cli/helix.nix
                ./modules/home/cli/fetch.nix
              ];
              home.username = "nixos";
              home.homeDirectory = "/home/nixos";
            };
            # Optionally, use home-manager.extraSpecialArgs to pass
            # arguments to home.nix
          }
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
          ./modules/home/cedev.nix
          {
            # Home Manager needs a bit of information about you and the paths it should
            # manage.
            home.username = "linus";
            home.homeDirectory = "/home/linus";
          }
        ];

        extraSpecialArgs = { inherit inputs; };
      };
      nixos = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [
          ./home.nix
          ./modules/home/cli
          ./modules/home/gui/vscode.nix
          {
            # Home Manager needs a bit of information about you and the paths it should
            # manage.
            home.username = "nixos";
            home.homeDirectory = "/home/nixos";
          }
        ];
        extraSpecialArgs = { inherit inputs; };
      };
      libewa = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./home.nix
          ./modules/home/cli
          {
            home.username = "libewa";
            home.homeDirectory = "/home/libewa";
          }
        ]; 
        extraSpecialArgs = { inherit inputs; };
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
