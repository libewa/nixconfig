{pkgs, ...}: {
  programs.kitty = {
    enable = true;
    font = {
      package = pkgs.cascadia-code;
      name = "Cascadia Code NF";
    };
    enableGitIntegration = true;
    settings = {
      cursor_trail = 5;
      scrollbar_interactive = true;
      remember_window_size = false;
      initial_window_width = 900;
      initial_window_height = 500;
    };
    quickAccessTerminalConfig = {
      start_as_hidden = true;
    };
  };
}
