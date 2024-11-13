{pkgs, ...}: {
  programs.hyprland.enable = true;
  programs.hyprlock.enable = true;
  # Enable the X11 windowing system.
  services.xserver.enable = true;
  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;
  xdg.portal = {
    enable = true;
    extraPortals = [pkgs.xdg-desktop-portal-hyprland];
  };
  services.gnome.gnome-keyring.enable = true;
}
