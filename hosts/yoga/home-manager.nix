{ config, inputs, pkgs, ...}:

{
  home-manager = {
    backupFileExtension = "bak";
    extraSpecialArgs = { inherit inputs; };
    users = {
      linus = import ../../homes/linus.nix;
    };
  };
}
