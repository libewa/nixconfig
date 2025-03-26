{pkgs, ...}: {
  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      nvim-lspconfig
      cmp-nvim-lsp
      luasnip
    ];
    extraPackages = with pkgs; [
      arduino-language-server
      sourcekit-lsp
      nil
      libclang
      deno
      nixd
      vscode-langservers-extracted
      dprint
      emmet-language-server
      rust-analyzer
      typescript
      nodePackages.typescript-language-server
      arduino-language-server
      emmet-language-server
    ];
    extraLuaConfig = builtins.readFile ../dotfiles/nvim/cmp-git.lua;
  };
}
