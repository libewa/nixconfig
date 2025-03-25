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
      neogit
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
    extraConfig =
      /*
      vim
      */
      ''
        set mouse=a
        set shiftwidth=2
        set foldcolumn=1
        set foldmethod=indent
	
	set foldlevelstart=99
	set lcs=tab:>->,lead:·,trail:·,extends:>,precedes:<,nbsp:¦

        map <C-p> :NvimTreeToggle<CR>
        map <C-d> :NvimTreeFocus<CR>
        map <C-Space> :Telescope<CR>
        map <C-S-Space> :Telescope<Space>commands<CR>
        map <C-y> :q<CR>
        map <C-s> :w<CR>
	map <C-ü> :terminal
      '';
    extraLuaConfig =
      /*
      lua
      */
      ''
        -- disable netrw at the very start of your init.lua
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        neogit = require('neogit')
        neogit.setup()
      '';
  };
}
