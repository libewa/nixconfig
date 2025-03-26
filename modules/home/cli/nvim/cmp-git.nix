{pkgs, ...}: {
  programs.neovim.plugins = with pkgs.vimPlugins; [
    cmp-git
  ];
  programs.neovim.extraLuaConfig = builtins.readFile ../dotfiles/nvim/cmp-git.lua;
}
