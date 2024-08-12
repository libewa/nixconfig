{
  services.borgbackup.jobs.home = { # Root backing each day up to a remote backup server. We assume that you have
    #   * created a password less key: ssh-keygen -N "" -t ed25519 -f /path/to/ssh_key
    #     best practices are: use -t ed25519, /path/to = /run/keys
    paths = [ "/etc" "/home" ];
    exclude = [ "/nix" "'**/.cache'" "'**/node_modules'" "'**/.venv'" "'**/venv'" ];
    repo =  "ssh://borg-backup@nas:22/volume1/backup/yoga";
    encryption.mode = "none";
    environment = { BORG_RSH = "ssh -i /run/keys/borg/id_ed25519_borg"; };
    compression = "auto,lzma";
    startAt = "daily";
  };
}
