{
  services.btrbk = {
    instances.nas = {
      onCalendar = "daily";
      settings = {
        ssh_identity = "/home/btrbk";
	ssh_user = "backup";
	stream_compress = "xz";
	snapshot_preserve = "7d 4w 12m";
	target_preserve = "7d 4w 12m";
	snapshot_preserve_min = "7d";
	volume."/btrfs-root" = {
	  target = "ssh://nas/volume1/backup/yoga";
	  subvolume = "/home";
	};
      };
    };
  };
}
