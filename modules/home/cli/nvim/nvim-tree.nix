{ pkgs, ... }:
{
  programs.neovim = {
    extraLuaConfig = ''
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

      require('nvim-tree').setup({
        on_attach = my_on_attach,
      })
    '';
    plugins = with pkgs.vimPlugins; [
      nvim-tree-lua
    ];
  };
}
