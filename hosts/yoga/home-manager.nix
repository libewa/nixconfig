{ inputs, ...}:

{
  home-manager = {
    backupFileExtension = "bak";
    extraSpecialArgs = { inherit inputs; };
    users = {
      linus = import ../../homes/linus.nix;
    };
  };
}
