{pkgs, ...}: {
  home.packages = with pkgs; [
    tree
    gh
    tea
    audacity
    lynx
    cmatrix
    nil
    ffmpeg
    lazygit
    rustup
    deno
    arduino-cli
    nix-search-cli
  ];
}
