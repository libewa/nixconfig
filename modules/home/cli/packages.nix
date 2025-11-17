{pkgs, ...}: {
  home.packages = with pkgs; [
    lazygit
    nix-search-cli
  ];
}
