{
  programs.fastfetch = {
    enable = true;
    settings = {
      modules = [
        "title"
        "separator"
        "os"
        "host"
        "kernel"
        "uptime"
        "shell"
        "de"
        "wm"
        "wmtheme"
        "theme"
        "cursor"
        "terminal"
        "locale"
        "separator"
        "cpu"
        "gpu"
        "memory"
        "swap"
        "disk"
        "localip"
        "battery"
        "poweradapter"
      ];
      display = {
        temp = {
          unit = "CELSIUS";
          ndigits = 0;
        };
        size = {
          maxPrefix = "PB";
          ndigits = 2;
        };
      };
      logo.printRemaining = true;
    };
  };
  programs.hyfetch = {
    enable = true;
    settings = {
      preset = "rainbow";
      mode = "rgb";
      light_dark = "dark";
      lightness = 0.65;
      color_align = {
        mode = "horizontal";
      };
      backend = "fastfetch";
      pride_month_disable = false;
    };
  };
}
