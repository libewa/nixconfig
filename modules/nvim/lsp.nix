{ pkgs, ...}:
{
  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      nvim-lspconfig
      cmp-nvim-lsp
    ];
    extraLuaConfig = ''
    lsp = require('lspconfig')
    -- Set up lspconfig.
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
    lsp.nil_ls.setup {
      capabilities = capabilities
    }
    lsp.sourcekit.setup {
      capabilities = capabilities
    }
    lsp.denols.setup {
      capabilities = capabilities
    }
    '';
  };
}
