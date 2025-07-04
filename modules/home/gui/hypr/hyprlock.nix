{
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        hide_cursor = true;
        grace = 5;
      };
      background = {
        monitor = "";
        path = "screenshot";

        blur_passes = 2; # 0 disables blurring
        blur_size = 7;
        noise = 0.0117;
        contrast = 0.8916;
        brightness = 0.8172;
        vibrancy = 0.1696;
        vibrancy_darkness = 0.0;
      };
      image = {
        monitor = "";
        path = "$HOME/.face";
        size = 150;
        rounding = -1; # negative values mean circle
        border_size = 4;
        border_color = "rgb(221, 221, 221)";
        rotate = 0;
        reload_time = -1; # seconds between reloading, 0 to reload with SIGUSR2
        reload_cmd = ""; # command to get new path. if empty, old path will be used. don't run "follow" commands like tail -F

        position = "0, 200";
        halign = "center";
        valign = "center";
      };

      label = [
        {
          monitor = "";
          text = "$USER";
          font = "Ubuntu Nerd Font";
          font_size = 20;
          font_color = "rgb(101, 101, 101)";
          outline_color = "rgb(0, 0, 0)";
          outline_thickness = 2;
          fade_on_empty = false;
          position = "0, 30";
          halign = "center";
          valign = "center";
        }
      ];

      input-field = {
        monitor = "";
        size = "200, 50";
        outline_thickness = 3;
        dots_size = 0.33; # Scale of input-field height, 0.2 - 0.8
        dots_spacing = 0.15; # Scale of dots' absolute size, 0.0 - 1.0
        dots_center = false;
        dots_rounding = -1; # -1 default circle, -2 follow input-field rounding
        outer_color = "rgb(151515)";
        inner_color = "rgb(200, 200, 200)";
        font_color = "rgb(10, 10, 10)";
        fade_on_empty = false;
        placeholder_text = "<i>Input Password...</i>"; # Text rendered in the input box when it's empty.
        hide_input = false;
        rounding = -1; # -1 means complete rounding (circle/oval)
        check_color = "rgb(204, 136, 34)";
        fail_color = "rgb(204, 34, 34)"; # if authentication failed, changes outer_color and fail message color
        fail_text = "<i>$FAIL <b>($ATTEMPTS)</b></i>"; # can be set to empty
        fail_transition = 300; # transition time in ms between normal outer_color and fail_color
        capslock_color = -1;
        numlock_color = -1;
        bothlock_color = -1; # when both locks are active. -1 means don't change outer color (same for above)
        invert_numlock = false; # change color if numlock is off
        swap_font_color = false; # see below

        position = "0, -20";
        halign = "center";
        valign = "center";
      };
    };
  };
}
