{pkgs, ...}: {
  home.packages = with pkgs; [
    signal-desktop
    musescore
    prusa-slicer
    vesktop
    thunderbird
    vlc
    imhex
    #ausweisapp
    arduino-ide
  ];
}
