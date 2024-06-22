{ pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autocd = true;
    initExtraFirst = "

    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias egrep='egrep --color=auto'
    alias la='ls -al --color=auto'
    alias ll='ls -l --color=auto'
    alias nrs='nixos-rebuild switch'
    alias hms='home-manager switch'

    fastfetch
    ";
    syntaxHighlighting = {
      enable = true;
      highlighters = [ "brackets" "main" ];
    };
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
  };
}

