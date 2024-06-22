{ config, pkgs, ... }:

let
  packages = with pkgs; [
    tree
    gh
    tea
    lynx
    cmatrix
    sl
    nil
    ffmpeg
  ];
in
{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.05"; # Please read the comment before changing.
  nixpkgs.config.allowUnfree = true;
 
  home.packages = packages;

  home.file = {
    #hypr = {
    #  target = ".config/hypr";
    #  source = ./dotfiles/hypr;
    #};
  };
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    terminal = "\${pkgs.kitty/bin/kitty}";
    extraConfig = {
      combi-modes = "window,drun,run,power-menu";
      modes = "combi";
      modi = "power-menu:rofi-power-menu";
    };
  };
  
  targets.genericLinux.enable = true;
  xdg.mime.enable = true;
  xdg.systemDirs.data = [ "${config.home.homeDirectory}/.nix-profile/share/applications" ];
  
  programs.oh-my-posh = {
    enable = false;
    enableZshIntegration = true;
    settings = pkgs.lib.fileContents (pkgs.writeText "libewa.omp.json" (builtins.fetchurl "https://gist.githubusercontent.com/libewa/bdeb367aea920128fc19eeba0f83f5c2/raw/ae74d3bdf1e5394f4d9ff6c19c8f3204e41ca030/libewa.omp.json"));
  };
}
