{ pkgs, ... }:
{
  home.packages = with pkgs; [
    signal-desktop
    swift
    swiftPackages.swiftpm
    sourcekit-lsp
    prusa-slicer
    thunderbird
    arduino-cli
  ];
}