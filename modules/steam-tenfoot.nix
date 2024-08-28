{ pkgs, ... }:
{
  services.cage = {
    enable = true;
    program = "${pkgs.steam}/bin/steam -tenfoot";
  };
}
