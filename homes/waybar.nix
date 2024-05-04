{
  programs.waybar = {
    enable = true;
    settings = {
      topbar = {
        height = 30;
        position = "top";
        modules-left = [ "tray" ];
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
        tray = {
          spacing = 10;
        };
        clock = {
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          format-alt = "{:%d.%m.%Y}";
        };
        memory = {
          format = "{}% ";
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
          tooltip-format = "{ifname} via {gwaddr} ";
          format-linked = "{ifname} (No IP) ";
          format-disconnected = "Disconnected ⚠";
          format-alt = "{ifname}: {ipaddr}/{cidr}";
        };

        pulseaudio = {
          format = "{volume}% {icon}";
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
  };
}