{ pkgs, ... }:
let
  sessionFile = (pkgs.writeTextDir "share/wayland-sessions/steam.desktop" ''
  [Desktop Entry]
  Name=Steam
  Comment=A digital distribution platform
  Exec=${pkgs.cage}/bin/cage -- ${pkgs.steam}/bin/steam -tenfoot
  Type=Application
  '').overrideAttrs (_: { passthru.providedSessions = [ "steam" ]; });
in
{
  environment.systemPackages = with pkgs; [ steam cage steam-rom-manager ];
  services.displayManager.sessionPackages = [ sessionFile ];
}
