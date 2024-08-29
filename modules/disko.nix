{
  disko.devices = {
    disk = {
      main = {
        device = "/dev/sda"; # the classic autoinstaller: format the first block device found
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
            luks = {
              size = "100%";
	      content = {
	        type = "luks";
		name = "crypt";
		settings = {
		  allowDiscards = true;
		};
		passwordFile = "/tmp/secret.key";
		content = {
		  type = "btrfs";
		  mountpoint = "/btrfs-root";
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
		    "/steam" = {
		      mountpoint = "/steam";
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
    };
    nodev = {
      "/tmp" = {
        fsType = "tmpfs";
	mountOptions = [ "size=10M" ];
      };
    };
  };
}
