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
    gimp
    breitbandmessung
    kdePackages.tokodon
    kmymoney
  ];
  services.nextcloud-client = {
    enable = true;
    startInBackground = true;
  };
}
