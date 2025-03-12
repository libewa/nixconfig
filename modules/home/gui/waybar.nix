{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings = {
      topbar = {
        height = 30;
        margin-top = 10;
        margin-left = 10;
        margin-right = 10;
        margin-bottom = 0;
        spacing = 10;
        position = "top";
        modules-left = ["custom/power" "tray" "hyprland/workspaces"];
        modules-right = ["network" "pulseaudio" "memory" "backlight" "keyboard-state" "hyprland/language" "battery" "clock"];

        keyboard-state = {
          numlock = false; # yoga laptop doesnt have numlock
          capslock = true;
          format = "{name}: {icon}";
          format-icons = {
            locked = "";
            unlocked = "";
          };
        };
        "hyprland/workspaces" = {
          format-icons = {
            empty = "◌";
            active = "";
            default = "⊙";
          };
          window-rewrite = {
            "class<firefox>" = "";
            "class<kitty>" = "";
            "class<codium>" = "󰨞";
            "title<debian12 auf QEMU/KVM>" = "";
            "class<steam>" = "";
          };
          window-rewrite-default = "+";
          format = "{name} {windows}";
          show-special = true;
          separate-outputs = true;
          persistent-workspaces = {
            "*" = [ "magic" ];
          };
        };
        tray = {
          spacing = 10;
        };
        clock = {
          tooltip-format = "{:%d.%m.%Y}";
        };
        memory = {
          format = "{}% ";
          on-click = "kitty htop";
        };
        "custom/power" = {
          format = "󰐥 Power options";
          on-click = "uwsm app -- rofi -show power-menu -modi power-menu:rofi-power-menu";
        };
        "custom/osk" = {
          format = "";
          tooltip-format = "Toggle on-screen keyboard";
          on-click = "pkill -34 wvkbd-mobintl";
        };
        backlight = {
          format = "{percent}% {icon}";
          format-icons = ["" "" "" "" "" "" "" "" ""];
        };
        battery = {
          states = {
            good = 95;
            warning = 30;
            critical = 15;
          };
          format = "{capacity}% {icon}";
          format-full = "{capacity}% 󱟢";
          format-charging = "{capacity}% 󰂄";
          format-plugged = "{capacity}% ";
          format-alt = "{time} {icon}";
          format-icons = ["󰂃" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂"];
        };

        network = {
          format-wifi = "{essid} ({signalStrength}%) ";
          format-ethernet = "{ipaddr}/{cidr} ";
          format-linked = "{ifname} (No IP) ";
          format-disconnected = "Disconnected ⚠";
          tooltip-format = "{ifname}: {ipaddr}/{cidr}";
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
      windowtitle = {
        height = 15;
        margin-left = 10;
        margin-right = 10;
        margin-top = 0;
        margin-bottom = 10;
        spacing = 10;
        position = "bottom";
        modules-center = ["hyprland/window"];
      };
    };
    style = builtins.readFile ../../../dotfiles/waybar/style.css;
  };
}
