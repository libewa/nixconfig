{pkgs, ...}: {
  programs.zsh = {
    enable = true;
    shellAliases = {
      ls = "ls --color=auto";
      la = "ls -Al --color=auto";
      ll = "ls -l --color=auto";
      grep = "grep --color=auto";
      egrep = "egrep --color=auto";
    };
    sessionVariables = {
      LANG = "en_US";
      LANGUAGE = "en_US";
      LC_ALL = "de_DE.UTF-8";
    };
    initExtra = "
      fastfetch
    ";
    syntaxHighlighting = {
      enable = true;
      highlighters = ["brackets" "main"];
    };
    defaultKeymap = "viins";

    plugins = [
      {
        name = "zsh-nix-shell";
        file = "nix-shell.plugin.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "chisui";
          repo = "zsh-nix-shell";
          rev = "v0.7.0";
          sha256 = "149zh2rm59blr2q458a5irkfh82y3dwdich60s9670kl3cl5h2m1";
        };
      }
    ];
    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "aliases"
        "colored-man-pages"
        "colorize"
        "cp"
        "extract"
        "history"
        "rand-quote"
      ];
      theme = "bira";
      extraConfig = ''
        ENABLE_CORRECTION="true"
      '';
    };
  };
}
