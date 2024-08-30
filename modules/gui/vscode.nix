{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    userSettings = {
      "workbench.colorTheme" = "Material Theme High Contrast";
      "workbench.iconTheme" = "eq-material-theme-icons-light";
      "nix.serverPath" = "nil";
      "nix.enableLanguageServer" = true;
      "git.enableSmartCommit" = true;
      "git.confirmSync" = false;
      "git.autofetch" = true;
      "swift.actionAfterBuildError" = "Focus Problems";
      "swift.sourcekit-lsp.serverPath" = "sourcekit-lsp";
    };
    keybindings = [
      {
        "key" = "ctrl+[Semicolon]";
        "command" = "workbench.action.terminal.toggleTerminal";
      }
    ];
    extensions = with pkgs.vscode-extensions; [
      vadimcn.vscode-lldb
      ms-azuretools.vscode-docker
      github.vscode-pull-request-github
      bbenoist.nix
      arrterian.nix-env-selector
      jnoortheen.nix-ide
      esbenp.prettier-vscode
      equinusocio.vsc-material-theme
      ms-vscode.cpptools
      denoland.vscode-deno
    ];
  };
}
