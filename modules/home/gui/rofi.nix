{pkgs, ...}: {
  home.packages = with pkgs; [
    rofi-power-menu
    networkmanagerapplet
  ];
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    terminal = "${pkgs.kitty.outPath}/bin/kitty";
    theme = "arthur";
    extraConfig = {
      combi-modes = "window,drun";
      modi = "power-menu:rofi-power-menu,combi";
    };
  };
}
