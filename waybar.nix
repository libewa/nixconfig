{
  programs.waybar = {
    enable = true;
    systemd.enable = false;
    settings = {
      topbar = {
        height = 30;
        spacing = 10;
        position = "top";
        modules-left = [ "custom/power" "tray" ];
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
    style = ''
    * {
      border: none;
      border-radius: 0;
      font-family: "Ubuntu Nerd Font";
      font-size: 13px;
      min-height: 0;
      background: none;
      color: #fff;
      padding-top: 2px;
      padding-bottom: 2px
    }

    window#waybar {
      /* From https://css.glass */
      background: rgba(255, 255, 255, 0.1);
      box-shadow: 0 4px 30px rgba(0, 0, 0, 0.1);
      border-bottom: 3px solid rgba(100, 114, 125, 0.5);
      padding-left: 4px;
      padding-right: 4px;
    }

    tooltip {
      background: rgba(43, 48, 59, 0.9);
      border: 1px solid rgba(100, 114, 125, 0.5);
    }
    '';
  };
}
