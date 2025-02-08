{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.05"; # Please read the comment before changing.
  nixpkgs.config.allowUnfree = true;

  home.file = {
    #hypr = {
    #  target = ".config/hypr";
    #  source = ./dotfiles/hypr;
    #};
  };
  
  targets.genericLinux.enable = true;
  xdg.mime.enable = true;
}
