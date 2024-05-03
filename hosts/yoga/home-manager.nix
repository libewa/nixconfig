{ config, inputs, pkgs, ...}:

{
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "linus" = pkgs.fetchgit {
        url = "https://gist.github.com/3169f2fc02aa56a78bae1cdf2231078d.git";
      }
    };
  };
}
