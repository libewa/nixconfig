{ pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    initExtraBeforeCompInit = "
      zstyle ':completion:*' completer _complete _ignored _approximate
      zstyle ':completion:*' expand suffix
      zstyle ':completion:*' file-sort name
      zstyle ':completion:*' format 'Completing %d'
      zstyle ':completion:*' group-name ''
      zstyle ':completion:*' ignore-parents parent pwd directory
      zstyle ':completion:*' list-colors ''
      zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
      zstyle ':completion:*' list-suffixes true
      zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' '+m:{[:lower:][:upper:]}={[:upper:][:lower:]} r:|[._-]=* r:|=*' 'l:|=* r:|=*'
      zstyle ':completion:*' max-errors 2
      zstyle ':completion:*' menu select=long
      zstyle ':completion:*' preserve-prefix '//[^/]##/'
      zstyle ':completion:*' prompt 'Corrections available, %e mistakes'
      zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
      zstyle ':completion:*' verbose true
      zstyle :compinstall filename '/home/linus/.zshrc'
    ";
    enableCompletion = true;
    autocd = true;
    shellAliases = {
      ls = "ls --color=auto";
      la = "ls -Al --color=auto";
      ll = "ls -l --color=auto";
      grep = "grep --color=auto";
      egrep = "egrep --color=auto";
      hms = "home-manager switch";
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
      highlighters = [ "brackets" "main" ];
    };
    cdpath = [
      "/"
      "/home/linus"
      "/home/groups"
    ];
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
    };
  };
}

