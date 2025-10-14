{pkgs, ...}: {
  services.displayManager.sddm = {
    theme = "breeze";
    enable = true;
    wayland.enable = true;
    enableHidpi = true;
  };
}
