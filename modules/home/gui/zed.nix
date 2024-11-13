{...}: {
  programs.zed-editor = {
    enable = true;
    userSettings = {
      theme = "XY-Zed";
      features = {
        copilot = false;
      };
      vim_mode = false;
      ui_font_size = 16;
      buffer_font_size = 16;
    };
    extensions = [
      "html"
      "dockerfile"
      "docker-compose"
      "swift"
      "git_firefly"
      "toml"
      "sql"
      "log"
      "emmet"
      "xy-zed"
      "latex"
      "xml"
      "nix"
      "assembly"
      "gdscript"
      "deno"
      "basher"
    ];
  };
}
