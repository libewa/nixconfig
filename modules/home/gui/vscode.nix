{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    profiles.default = {
      userSettings = {
        "nix.serverPath" = "nil";
        "nix.enableLanguageServer" = true;
        "git.enableSmartCommit" = true;
        "git.confirmSync" = false;
        "git.autofetch" = true;
        "editor.fontFamily" = "'CascadiaCodeNF' 'Droid Sans Mono', 'monospace', monospace";
        "editor.fontLigatures" = true;
        "editor.formatOnPaste" = true;
        "workbench.colorTheme" = "Abyss";
        "diffEditor.codeLens" = true;
        "explorer.confirmDragAndDrop" = false;
        "workbench.iconTheme" = "eq-material-theme-icons";
      };
      keybindings = [
        {
          "key" = "ctrl+[Semicolon]";
          "command" = "workbench.action.terminal.toggleTerminal";
        }
      ];
      extensions = with pkgs.vscode-extensions; [
        ms-vscode-remote.vscode-remote-extensionpack
        ms-vscode.cpptools-extension-pack
        firefox-devtools.vscode-firefox-debug
        pkief.material-icon-theme
        bbenoist.nix
        #ms-vscode.remote-explorer
        #ms-vscode.remote-repositories
        #ms-vscode.vscode-serial-monitor
        ms-azuretools.vscode-docker
        #github.remotehub
        github.copilot
        github.copilot-chat
        github.vscode-pull-request-github
        editorconfig.editorconfig
        eamodio.gitlens
        ms-vscode.hexeditor
        visualstudioexptteam.vscodeintellicode
        visualstudioexptteam.intellicode-api-usage-examples
        ms-vscode.live-server
        esbenp.prettier-vscode
        redhat.vscode-yaml
        #swiftlang.swift-vscode
        bierner.github-markdown-preview
      ];
    };
  };
}
