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
    };
    quickAccessTerminalConfig = {
      start_as_hidden = true;
    };
  };
}
