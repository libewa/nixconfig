{ pkgs, ... }:
{
  imports = [
    ./lsp.nix
    ./nvim-cmp.nix
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

      local function my_on_attach(bufnr)
        local api = require "nvim-tree.api"

        local function opts(desc)
          return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end

        -- default mappings
        api.config.mappings.default_on_attach(bufnr)

        -- custom mappings
        vim.keymap.set('n', '<C-l>', api.tree.change_root_to_node,        opts('cd'))
      end

      neogit = require('neogit')
      neogit.setup()

      require('nvim-tree').setup({
        on_attach = my_on_attach,
      })
    '';
  };
}
