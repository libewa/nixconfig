{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings = {
      topbar = {
        height = 30;
        spacing = 10;
        position = "top";
        modules-left = [ "custom/power" "tray" "hyprland/workspaces" ];
        modules-center = [ "hyprland/window" ];
        modules-right = [ "network" "pulseaudio" "memory" "backlight" "keyboard-state" "hyprland/language" "battery" "clock" ];

        keyboard-state = {
          numlock = false; # yoga laptop doesnt have numlock
          capslock = true;
          format = "{name} {icon}";
          format-icons = {
            locked = "";
            unlocked = "";
          };
        };
        "hyprland/workspaces" = {
          format-icons = {
            empty = "";
            active = "";
            default = "";
          };
          format = "{icon}";
        };
        tray = {
          spacing = 10;
        };
        clock = {
          tooltip-format = "{:%d.%m.%Y}";
        };
        memory = {
          format = "{}% ";
        };
        "custom/power" = {
          format = "󰐥 Power options";
          on-click = "rofi -show power-menu -modi power-menu:rofi-power-menu";
        };
        backlight = {
          format = "{percent}% {icon}";
          format-icons = [ "" "" "" "" "" "" "" "" "" ];
        };
        battery = {
          states = {
            good = 95;
            warning = 30;
            critical = 15;
          };
          format = "{capacity}% {icon}";
          format-full = "{capacity}% {icon}";
          format-charging = "{capacity}% ";
          format-plugged = "{capacity}% ";
          format-alt = "{time} {icon}";
          format-icons = ["" "" "" "" ""];
        };

        network = {
          format-wifi = "{essid} ({signalStrength}%) ";
          format-ethernet = "{ipaddr}/{cidr} ";
          format-linked = "{ifname} (No IP) ";
          format-disconnected = "Disconnected ⚠";
          tooltip-format = "{ifname}: {ipaddr}/{cidr}";
          on-click = "networkmanager_dmenu";
        };

        pulseaudio = {
          format = "{volume}% {icon}";
          format-muted = "{volume}% ";
          format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = ["" "" ""];
          };
          on-click = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
        };
      };
    };
    style = builtins.readFile ../dotfiles/waybar/style.css;
  };
}
