{pkgs, ...}: {
  programs.nixvim.plugins = {
    lspkind.enable = true;
    cmp = {
      enable = true;
      settings = {
        completion = {
          keyword_length = 1;
        };
        sources = [
          { name="nvim_lsp"; }
          { name="buffer"; }
          { name="emoji"; }
          { name="git"; }
          { name="latex_symbols"; }
          { name="path"; }
        ];
      };
    };
  };
}
