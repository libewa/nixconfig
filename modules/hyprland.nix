{ pkgs, ... }:
{
  home.packages = with pkgs; [
    kitty
    hyprnome
    gnome.nautilus
    hyprlock
    swayosd
    swaynotificationcenter
    udiskie
    notify-desktop
    wl-clipboard
    grimblast
  ] ++ [(writeShellScriptBin "exitwindow" ''
    if [ "$(hyprctl activewindow -j | jq -r ".class")" = "Steam" ]; then
      xdotool getactivewindow windowunmap
    else
      hyprctl dispatch killactive ""
    fi
    '')];

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "$terminal" = "kitty || xterm";
      "$fileManager" = "nautilus";
      "$wwwbrowser" = "firefox";
      "$menu" = "rofi -show combi";
      "$mainMod" = "SUPER";

      env = [
        "GDK_BACKEND,wayland,x11,*"
        "SDL_VIDEODRIVER,wayland"
        "CLUTTER_BACKEND,wayland"
        "ELECTRON_OZONE_PLATFORM_HINT,wayland"

        "XCURSOR_SIZE,24"
        "QT_QPA_PLATFORMTHEME,qt5ct"
      ];

      exec-once = [
        "swaync"
        "${pkgs.kdePackages.polkit-kde-agent-1.outPath}/libexec/polkit-kde-authentication-agent-1"
        "wl-paste --watch cliphist store"
        "udiskie &"
        "swayosd-server"
        "xhost +SI:localuser:root"
        "wvkbd-mobintl -o --landscape-layers landscape,landscapespecial -L 300 --hidden"
      ];

      input = {
        kb_layout = "de";

        follow_mouse = 1;

        touchpad = {
          natural_scroll = true;
        };

        sensitivity = 0; # -1.0 to 1.0, 0 means no modification.
      };

      general = {
        # See https://wiki.hyprland.org/Configuring/Variables/ for more

        gaps_in = 5;
        gaps_out = 20;
        border_size = 2;
        "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";

        layout = "dwindle";

        # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
        allow_tearing = false;
      };

      decoration = {
        # See https://wiki.hyprland.org/Configuring/Variables/ for more

        rounding = 10;

        blur = {
            enabled = true;
            size = 3;
            passes = 1;
        };

        drop_shadow = true;
        shadow_range = 4;
        shadow_render_power = 3;
        "col.shadow" = "rgba(1a1a1aee)";
      };

      animations = {
        enabled = true;

        # Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more

        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";

        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };

      dwindle = {
        # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
        pseudotile = false; # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
        preserve_split = true; # you probably want this
      };
      master = {
          # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
          new_is_master = true;
      };

      gestures = {
        workspace_swipe = true;
      };

      misc = {
        force_default_wallpaper = 0;
      };

      windowrule = [
        "stayfocused,title:rofi*"
      ];

      windowrulev2 = [
        "suppressevent maximize, class:.*"
      ];

      bind = [
        "$mainMod, o, exec, rofi -show power-menu -modi power-menu:rofi-power-menu"
        "$mainMod,space,exec,pkill rofi || rofi -show combi"
        "$mainMod, V, exec, cliphist list | rofi -dmenu | cliphist decode | wl-copy"

        "$mainMod, Q, exec, $terminal"
        "$mainMod, B, exec, $wwwbrowser"
        "$mainMod, C, exec, exitwindow"
        "$mainMod, M, exit, "
        "$mainMod, E, exec, $fileManager"
        "$mainMod, F, togglefloating, "
        "$mainMod, P, pseudo, " # dwindle
        "$mainMod, J, togglesplit," # dwindle
        "$mainMod, Print, exec, grimblast copy area"
        "SUPER_SHIFT, Print, exec, grimblast --notify copysave screen"

        # move focus with arrow keys
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"

        # switch workspaces
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"

        # scratchpad
        "$mainMod, S, togglespecialworkspace, magic"
        "$mainMod SHIFT, S, movetoworkspace, special:magic"
      ];

      bindm = [
        "$mainMod, mouse:272, movewindow" #lmb
        "$mainMod, mouse:273, resizewindow" #rmb
      ];

      bindel = [
        ", XF86AudioRaiseVolume, exec, swayosd-client --output-volume raise"
        ", XF86AudioLowerVolume, exec, swayosd-client --output-volume lower"
      ];

      bindl = [
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ", XF86MonBrightnessUp, exec, swayosd-client --brightness +5"
        ", XF86MonBrightnessDown, exec, swayosd-client --brightness -5"
      ];
    };
  };
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [
        "/home/linus/Bilder/Pikmin_Wallpaper_Sunflower_3840x2160.jpg"
      ];
      wallpaper = [
        ", /home/linus/Bilder/Pikmin_Wallpaper_Sunflower_3840x2160.jpg"
      ];
      splash = true;
    };
  };
}
