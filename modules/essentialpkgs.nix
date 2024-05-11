{ pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    tldr
    sl
    nmap
    gcc
    fastfetch
    killall
    htop
  ];
  programs = {
    neovim.enable = true;
    git.enable = true;
    zsh.enable = true;
    nix-ld.enable = true;
  };
}