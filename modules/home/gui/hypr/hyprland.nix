{pkgs, ...}: {
  home.packages = with pkgs; [
    kitty
    hyprnome
    kdePackages.dolphin
    swayosd
    swaynotificationcenter
    udiskie
    file-roller
    notify-desktop
    wl-clipboard
    grimblast
    cliphist
    rofi-wayland
    whitesur-icon-theme

    hyprpolkitagent
    hyprpicker
    hyprsunset
  ];

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-hyprland
      xdg-desktop-portal-wlr
      xdg-desktop-portal-gtk
    ];
    xdgOpenUsePortal = true;
  };
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false;
    settings = {
      "$mainMod" = "SUPER";

      exec-once = with pkgs; [
        "uwsm app -- swaync"
        "uwsm app -- wl-paste --watch ${cliphist}/bin/cliphist store"
        "uwsm app -- udiskie &"
        "uwsm app -- swayosd-server"
        "uwsm app -- blueman-applet"
        "uwsm app -- ${hyprpolkitagent}/libexec/hyprpolkitagent"
      ];

      input = {
        kb_layout = "de";
        kb_variant = "e1";
        kb_options = "grp:sclk_toggle";

        follow_mouse = 1;

        touchpad = {
          natural_scroll = true;
          tap-to-click = false;
          disable_while_typing = true;
          clickfinger_behavior = true;
        };

        sensitivity = 0; # -1.0 to 1.0, 0 means no modification.
      };
      cursor.no_hardware_cursors = false;

      general = {
        # See https://wiki.hyprland.org/Configuring/Variables/ for more

        gaps_in = 5;
        gaps_out = 10;
        border_size = 2;
        "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";
        resize_on_border = true;

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

        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
          color = "rgba(1a1a1aee)";
        };
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
        special_scale_factor = 0.8;
      };
      master = {
        new_status = "inherit";
        new_on_top = true;
        orientation = "center";
        special_scale_factor = 0.8;
      };

      gestures = {
        workspace_swipe = true;
      };

      misc = {
        #force_default_wallpaper = 0;
        disable_splash_rendering = true;
      };

      windowrule = [
        "stayfocused,title:rofi*"
        "float,title:*Polkit Agent"
      ];

      windowrulev2 = [
        "suppressevent maximize, class:.*"
      ];

      bind = [
        "$mainMod, O, exec, uwsm app -- rofi -show power-menu -modi power-menu:rofi-power-menu"
        "$mainMod,space,exec,pkill rofi || uwsm app -- rofi -show drun"
        "$mainMod, V, exec, uwsm app -- cliphist list | rofi -dmenu | cliphist decode | wl-copy"

        "$mainMod, T, exec, uwsm app -- kitty || xterm"
        "$mainMod, B, exec, uwsm app -- firefox-devedition"
        "$mainMod, C, killactive, "
        "$mainMod, E, exec, uwsm app -- dolphin"
        "$mainMod, F, togglefloating, "
        "$mainMod, P, pseudo, " # dwindle
        "$mainMod, J, togglesplit," # dwindle
        "$mainMod, J, layoutmsg, swapwithmaster"
        "$mainMod, I, exec, uwsm app -- hyprpicker -anr -f hex"
        "$mainMod, Z, exec, uwsm app -- zeditor"
        "$mainMod, X, exec, pkill hyprsunset || uwsm app -- hyprsunset"

        "$mainMod, Print, exec, uwsm app -- grimblast --notify copy area"
        "$mainMod SHIFT, Print, exec, uwsm app -- grimblast --notify copysave area"
        "$mainMod ALT_SHIFT, Print, exec, uwsm app -- grimblast --notify copysave screen"
        "$mainMod ALT, Print, exec, uwsm app -- grimblast --notify copy screen"

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

      bindl = [
        ", switch:Lid Switch, exec, loginctl lock-session"
      ];

      bindeli = [
        ", XF86AudioRaiseVolume, exec, swayosd-client --output-volume raise"
        ", XF86AudioLowerVolume, exec, swayosd-client --output-volume lower"
        ", XF86MonBrightnessUp, exec, swayosd-client --brightness +5"
        ", XF86MonBrightnessDown, exec, swayosd-client --brightness -5"
      ];

      bindli = [
        ", XF86AudioMute, exec, swayosd-client --output-volume=mute-toggle"
      ];
    };
  };
}
