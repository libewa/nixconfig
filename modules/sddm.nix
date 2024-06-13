{ pkgs, ... }:
{
  services.displayManager.sddm = {
    enable = true;
    sugarCandyNix = {
      enable = true;
      settings = {
        Background = pkgs.fetchurl {
          url = "https://web.archive.org/web/20220728150410if_/https://i.redd.it/p3iy6aa826e91.png";
          hash = "sha256-dsKObMrits5+ZimnshPOc9eNtRv922bOrSvlCgpzUHs=";
        };
        HaveFormBackground = true;
        PartialBlur = true;
        FormPosition = "left";
        HeaderText = "Willkommen!";
        DateFormat = "dddd, d. MMMM yyyy";
      };
    };
  };
}
