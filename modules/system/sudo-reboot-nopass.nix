{ pkgs, ...}:
{
  security.sudo.extraRules = [
    {
      commands = [
        {
          command = "${pkgs.systemd}/bin/reboot";
          options = ["NOPASSWD"];
        }
      ];
    }
  ];
}