{pkgs, ...}: {
  home.packages = with pkgs; [
    #rust-analyzer
    typescript-language-server
    yaml-language-server
    marksman
    taplo
  ];

  programs.helix = {
    enable = true;
    defaultEditor = true;
    ignores = [
      ".build/"
      "!.gitignore"
    ];
    settings = {
      editor = {
        middle-click-paste = false;
        cursorline = true;
        completion-trigger-len = 3;
        bufferline = "always";
        statusline = {
          left = [
            "mode"
            "spinner"
          ];
          center = [
            "file-modification-indicator"
            "file-name"
            "read-only-indicator"
          ];
          right = [
            "diagnostics"
            "selections"
            "position"
            "file-encoding"
            "file-line-ending"
          ];
          mode = {
            normal = "--NORMAL--";
            insert = "--INSERT--";
            select = "--SELECT--";
          };
        };
        cursor-shape = {
          insert = "bar";
        };
        auto-save.after-delay = {
          enable = true;
          timeout = 10000;
        };
        whitespace.render = "all";
        indent-guides.render = true;
      };
      keys = {
        normal = {
          C-s = ":w";
        };
      };
    };
  };
}
