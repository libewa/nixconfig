{pkgs, ...}: {
  imports = [
    ./lsp.nix
    ./nvim-cmp.nix
    ./nvim-tree.nix
    ./cmp-git.nix
    ./copilot.nix
  ];
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    plugins = with pkgs.vimPlugins; [
      nvim-treesitter.withAllGrammars
      plenary-nvim
      {
        plugin = neogit;
        config = ''
          set g.loaded_netrw = 1
          set g:loaded_netrwPlugin = 1
          lua require('neogit').setup()
        '';
      }
      conflict-marker-vim
      telescope-nvim
      todo-comments-nvim
      nvim-tree-lua
      nvim-web-devicons
      {
        plugin = neoconf-nvim;
        config = ''
          lua require('neoconf').setup()
        '';
      }
      diffview-nvim
      {
        plugin = instant-nvim;
        config = ''
          let g:instant_username = "libewa"
        '';
      }
      {
        plugin = indent-blankline-nvim;
        config = ''
          lua require("ibl").setup()
        '';
      }
    ];
    extraPackages = with pkgs; [
      ripgrep
      fd
      nodejs
    ];
    extraConfig = builtins.readFile ../dotfiles/nvim/init.vim;
  };
}
