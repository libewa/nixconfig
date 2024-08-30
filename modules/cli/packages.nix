{ pkgs, ... }:
{
  home.packages = with pkgs; [
    tree
    gh
    tea
    audacity
    lynx
    cmatrix
    sl
    nil
    ffmpeg
    lazygit

    rustc cargo
  ];
}
