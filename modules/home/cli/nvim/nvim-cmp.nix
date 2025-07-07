{pkgs, ...}: {
  programs.nixvim.plugins.cmp = {
    settings = {
      snippet.expand = ''
        function(args)
          require('luasnip').lsp_expand(args.body)
        end
      '';
      formatting.format = /*lua*/''
        lspkind.cmp_format({
          mode = "symbol",
          maxwidth = {
            menu = function()
              return math.floor(0.45 * vim.o.columns)
            end,
            abbr = function()
              return math.floor(0.3 * vim.o.columns)
            end,
          },
          ellipsis_char = "…",
          symbol_map = { Copilot = "" },
        })
      '';
      sorting = {
        priority_weight = 2;
        comparators = [
          "require('copilot_cmp.comparators').prioritize"
			    "require('cmp.config.compare').offset"
        ];
      };
    };
  };
}
