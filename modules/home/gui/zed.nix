#NOTE: The Zed binary is called `zeditor` on NixOS
{...}: {
  programs.zed-editor = {
    enable = false;
    userSettings = {
      ui_font_size = 16;
      buffer_font_size = 16;
      theme = "Atelier Sulphurpool Dark";
      buffer_font_family = "Cascadia Code NF";
      ui_font_family = "Cascadia Code NF";
      vim_mode = false;
      auto_signature_help = true;
      calls.mute_on_join = true;

      lsp = {
        deno.settings.deno.enable = true;
      };
      languages = {
        "TypeScript" = {
          language_servers = [
            "deno"
            "!typescript-language-server"
            "!vtsls"
            "!eslint"
          ];
          formatter = "language_server";
        };
        "JavaScript" = {
          language_servers = [
            "deno"
            "!typescript-language-server"
            "!vtsls"
            "!eslint"
          ];
          formatter = "language_server";
        };
        "TSX" = {
          language_servers = [
            "deno"
            "!typescript-language-server"
            "!vtsls"
            "!eslint"
          ];
          formatter = "language_server";
        };
      };
    };
    extensions = [
      "html"
      "swift"
      "git_firefly"
      "log"
      "emmet"
      "latex"
      "xml"
      "nix"
      "assembly"
      "gdscript"
      "deno"
      "scss"
      "basher"
    ];
  };
}
