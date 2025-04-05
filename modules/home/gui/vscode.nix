{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    userSettings = {
      "nix.serverPath" = "nil";
      "nix.enableLanguageServer" = true;
      "git.enableSmartCommit" = true;
      "git.confirmSync" = false;
      "git.autofetch" = true;
      #"editor.fontFamily" = "'CascadiaCodeNF-Regular' 'Droid Sans Mono', 'monospace', monospace";
      "editor.fontLigatures" = true;
      "editor.formatOnPaste" = true;
    };
    keybindings = [
      {
        "key" = "ctrl+[Semicolon]";
        "command" = "workbench.action.terminal.toggleTerminal";
      }
    ];
  };
}
