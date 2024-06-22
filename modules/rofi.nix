{ pkgs, ... }:
{
  home.packages = with pkgs; [
    rofi-power-menu
    networkmanager_dmenu
    networkmanagerapplet
  ];
  xdg.configFile."networkmanager-dmenu".source = ../dotfiles/networkmanager-dmenu;
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    terminal = "${pkgs.kitty.outPath}/bin/kitty";
    extraConfig = {
      combi-modes = "window,drun,run,power-menu";
      modes = "combi";
      modi = "power-menu:rofi-power-menu";
    };
  };
}
