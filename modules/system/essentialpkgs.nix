{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    tldr
    sl
    nmap
    gcc
    fastfetch
    killall
    htop
    wget
    curl
  ];
  programs = {
    neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
      defaultEditor = true;
    };
    git.enable = true;
    zsh.enable = true;
    nix-ld.enable = true;
    gnupg.agent.enable = true;
    gnupg.agent.pinentryPackage = pkgs.pinentry-curses;
  };
  services.pcscd.enable = true;
}
