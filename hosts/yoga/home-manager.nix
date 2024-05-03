{ config, inputs, ...}:

{
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "linus" = import ../../homes/linus.nix;
    };
  };
}
