{pkgs, ...}: {
  programs.neovim.plugins = [
    {
      plugin = pkgs.vimPlugins.copilot-lua;
      config = ''
        lua require('copilot').setup({ copilot_model = "gpt-4o-copilot" })
      '';
    }
    {
      plugin = pkgs.vimPlugins.copilot-cmp;
      config = ''
        lua require("copilot_cmp").setup()
      '';
    }
  ];
}
