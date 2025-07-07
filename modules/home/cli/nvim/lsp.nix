{pkgs, ...}: {
  programs.nixvim = {
    plugins.lsp = {
        enable = true;
        #TODO: snippets
        servers = {
          nil_ls.enable = true;
          nixd.enable = true;
          sourcekit.enable = true;
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
          #rust_analyzer.enable = true;
        };
      };
    extraConfigLua = /*lua*/ ''
    vim.g.markdown_fenced_languages = {
      "ts=typescript"
    }
    '';
  };
}
