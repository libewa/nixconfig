{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    vscodium
    pv
    fastfetch
  ];
  programs.nh = {
    enable = true;
    clean.enable = true;
    flake = "/home/nixos/nixconfig";
  };
  programs.zsh.enable = true;
}
