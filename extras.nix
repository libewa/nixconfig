{ pkgs, ... }:
{
  home.packages = with pkgs; [
    signal-desktop
    swift
    yt-dlp
    tartube
    swiftPackages.swiftpm
    sourcekit-lsp
    prusa-slicer
    thunderbird
    arduino-cli
  ];
}
