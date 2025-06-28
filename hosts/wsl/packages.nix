{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
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
