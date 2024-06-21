{ pkgs, ... }:
{
  imports = [
    ./lsp.nix
    ./nvim-cmp.nix
    ./nvim-tree.nix
  ];
  home.packages = with pkgs; [
    fd
    ripgrep
  ];
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    plugins = with pkgs.vimPlugins; [
      nvim-treesitter.withAllGrammars
      plenary-nvim
      neogit
      conflict-marker-vim
      telescope-nvim
      todo-comments-nvim
      nvim-tree-lua
      neoconf-nvim
      diffview-nvim
    ];
    extraConfig = ''
      set mouse=a
      set shiftwidth=2
      map <C-p> :NvimTreeToggle<CR>
    '';
    extraLuaConfig = /* lua */ ''
      -- disable netrw at the very start of your init.lua
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
      require('neoconf').setup()
      
      neogit = require('neogit')
      neogit.setup()
    '';
  };
}
