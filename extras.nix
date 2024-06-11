{ pkgs, ... }:
{
  home.packages = with pkgs; [
    signal-desktop
    swift
    yt-dlp
    tartube
    swiftPackages.swiftpm
    musescore
    sourcekit-lsp
    prusa-slicer
    vesktop
    thunderbird
    arduino-cli
  ];
}
