{ config, pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    tldr
    sl
  ];
  programs = {
    neovim.enable = true;
    git.enable = true;
    zsh.enable = true;
    nix-ld.enable = true;
  };
}