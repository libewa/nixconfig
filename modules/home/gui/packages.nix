{pkgs, ...}: {
  home.packages = with pkgs; [
    signal-desktop
    musescore
    prusa-slicer
    vesktop
    thunderbird
    vlc
    imhex
    ausweisapp
    arduino-ide
  ];
  services.nextcloud-client = {
    enable = true;
    startInBackground = true;
  };
}
