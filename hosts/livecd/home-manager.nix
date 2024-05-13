{ inputs, ...}:

{
  home-manager = {
    backupFileExtension = "bak";
    extraSpecialArgs = { inherit inputs; };
    users = {
      #nixos = import ../../homes/livecd.nix;
    };
  };
}
