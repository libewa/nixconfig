{
  description = "Home Manager configuration of linus";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:libewa/home-manager-1/zed-editor";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... } :
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      homeConfigurations = {
        "linus" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;

          # Specify your home configuration modules here, for example,
          # the path to your home.nix.
          modules = [
            ./home.nix
            ./modules/gui
            ./modules/cli
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
        nixos = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;

          modules = [
            ./home.nix
            ./modules/cli
            {
              # Home Manager needs a bit of information about you and the paths it should
              # manage.
              home.username = "nixos";
              home.homeDirectory = "/home/nixos";
            }
	        ];
        };
      };
      nixosModules.livecd = { inputs, ... }: {
        imports = [
          inputs.home-manager.nixosModules.home-manager
        ];
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.users.nixos = {
          imports = [
            ./home.nix
            ./modules/cli
            ./modules/gui
            {
              home.username = "nixos";
              home.homeDirectory = "/home/nixos";
            }
          ];
        };

        # Optionally, use home-manager.extraSpecialArgs to pass
        # arguments to home.nix
      };
    };
}
