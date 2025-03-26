{pkgs, ...}: {
  programs.neovim = {
    extraLuaConfig = builtins.readFile ../dotfiles/nvim/nvim-tree.lua;
    plugins = with pkgs.vimPlugins; [
      nvim-tree-lua
    ];
  };
}
