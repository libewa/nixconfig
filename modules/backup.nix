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
          target."/mnt/yoga" = {
	    incremental = "yes";
	  };
	  /*target."raw ssh://nas/volume1/backup/yoga" = {
	    ssh_user = "backup";
	    incremental = "no";
	  };*/
	};
        timestamp_format = "long";
      };
    };
  };
  services.cron = {
    enable = true;
    systemCronJobs = [ "0 * * * * /usr/bin/env btrbk snapshot" ];
  };
}
