{pkgs, ...}: {
  home.packages = with pkgs; [
    signal-desktop
    musescore
    prusa-slicer
    vesktop
    thunderbird
    arduino-cli
    vlc

    jetbrains-toolbox
    jetbrains.clion
    jetbrains.webstorm
  ];
}
