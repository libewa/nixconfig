{
  services.logind.powerKey = "hibernate";
  services.logind.powerKeyLongPress = "poweroff";
  systemd.sleep.extraConfig = ''
  HibernateDelaySec=10m
  SuspendState=mem
  '';
}
