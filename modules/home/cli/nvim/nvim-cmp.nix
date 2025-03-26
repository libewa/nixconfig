{pkgs, ...}: {
  programs.neovim.plugins = with pkgs.vimPlugins; [
    plenary-nvim
    nvim-cmp
    lspkind-nvim
  ];
  programs.neovim.extraLuaConfig = builtins.readFile ../dotfiles/nvim/nvim-cmp.lua;
}
