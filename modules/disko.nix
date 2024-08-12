{
  disko.devices = {
    disk = {
      sda = {
        device = "/dev/disk/by-diskseq/1"; # the classic autoinstaller: format the first block device found
	type = "disk";
	content = {
	  type = "gpt";
	  partitions = {
	    ESP = {
	      size = "1024M";
	      type = "EF00";
	      content = {
	        type = "filesystem";
		format = "vfat";
		mountpoint = "/boot";
	      };
	    };
	    btrfs = {
	      size = "100%";
	      mountpoint = "/btrfs-root";
	      swap.swapfile.size = "4G";
	      subvolumes = {
	        "/rootfs" = {
		  mountpoint = "/";
		};
		"/home" = {
		  mountpoint = "/home";
		  mountOptions = [ "compress=zstd" ];
		};
		"/nix-store" = {
		  mountpoint = "/nix/store";
		  mountOptions = [ "noatime" "compress=zstd" ];
		};
		"/swap" = {
		  mountpoint = "/.swapvolume";
		  swap = {
		    swapfile.size = "4G";
		  };
		};
	      };
	    };
	  };
	};
      };
    };
  };
}
