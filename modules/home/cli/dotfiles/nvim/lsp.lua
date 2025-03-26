lsp = require('lspconfig')
-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
lsp.nil_ls.setup {
  capabilities = capabilities,
}
lsp.nixd.setup {
  capabilities = capabilities
}
lsp.sourcekit.setup {
  capabilities = capabilities
}
vim.g.markdown_fenced_languages = {
  "ts=typescript"
}
lsp.denols.setup {
  capabilities = capabilities,
  settings = {
      enable = true,
      suggest = {
      imports = {
        hosts = {
          ["https://deno.land"] = true,
          ["https://jsr.io"] = true
        }
      }
    }
  }
}
lsp.arduino_language_server.setup {
  capabilities = capabilities
}

lsp.cssls.setup {
  capabilities = capabilities
}
lsp.jsonls.setup {
  capabilities = capabilities
}
lsp.html.setup {
  capabilities = capabilities
}

lsp.dprint.setup {
  capabilities = capabilities
}
lsp.emmet_language_server.setup {
  capabilities = capabilities
}
lsp.rust_analyzer.setup {
  capabilities = capabilities
}

require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_snipmate").lazy_load()