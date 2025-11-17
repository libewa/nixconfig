{pkgs, ...}: {
  programs.nixvim = {
    plugins.luasnip.enable = true;
    plugins.lsp-lines.enable = true;
    plugins.lsp-status.enable = true;
    plugins.lsp = {
      enable = true;
      servers = {
        nil_ls.enable = true;
        nixd.enable = true;
        #sourcekit.enable = true;
        denols = {
          enable = true;
          settings.suggest.imports.hosts = [
            "https://deno.land"
            "https://jsr.io"
          ];
        };
        arduino_language_server.enable = true;
        cssls.enable = true;
        jsonls.enable = true;
        html.enable = true;
        clangd.enable = true;
        dprint.enable = true;
        emmet_language_server.enable = true;
        rust_analyzer = {
          enable = true;
          installCargo = false;
          installRustc = false;
        };
      };
    };
    extraConfigLua =
      /*
      lua
      */
      ''
        vim.g.markdown_fenced_languages = {
          "ts=typescript"
        }
      '';
  };
}
