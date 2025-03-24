{pkgs, ...}: {
  home.packages = with pkgs; [
    signal-desktop
    musescore
    prusa-slicer
    vesktop
    thunderbird
    arduino-cli
    vlc
    imhex
    #ausweisapp
    arduino-ide

    jetbrains-toolbox
    jetbrains.clion
    jetbrains.webstorm
  ];
}
