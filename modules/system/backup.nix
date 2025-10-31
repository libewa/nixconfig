{
  services.btrbk = {
    instances.btrbk = {
      onCalendar = "daily";
      settings = {
        snapshot_dir = "/btrbk_snapshots";
        snapshot_preserve_min = "4h";
        snapshot_preserve = "48h";
        target_preserve_min = "no";
        target_preserve = "7d 8w *m";
        raw_target_compress = "xz";
        volume."/btrfs-root" = {
          subvolume = "/home";
          target."raw ssh://192.168.178.40/volume1/backup/yoga" = {
            ssh_user = "backup";
            incremental = "no";
            ssh_identity = "/etc/btrbk/id_ed25519";
          };
        };
        timestamp_format = "long";
      };
    };
  };
}
