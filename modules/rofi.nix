{ pkgs, ... }:
{
  home.packages = with pkgs; [
    rofi-power-menu
    networkmanagerapplet
  ];
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
