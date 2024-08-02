{ pkgs, ... }:
{
  home.packages = with pkgs; [
    signal-desktop
    swift
    swiftPackages.swiftpm
    musescore
    sourcekit-lsp
    prusa-slicer
    vesktop
    thunderbird
    arduino-cli
    vlc
  ];
}
