{
  # Open ports in the firewall.
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [80 443];
    allowedUDPPorts = [];
    allowedTCPPortRanges = [
      {
        from = 8080;
        to = 8090;
      }
    ];
    allowedUDPPortRanges = [
      # as above
    ];
  };
}
