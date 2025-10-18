{pkgs, inputs, ...}: {
  imports = [
    inputs.nixvim.homeModules.nixvim
    ./lsp.nix
    ./nvim-cmp.nix
    ./keybinds.nix
  ];
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    plugins = {
      treesitter = {
        enable = true;
        folding = true;
        settings = {
          indent.enable = true;
          highlight.enable = true;
        };
      };
      neogit.enable = true;
      git-conflict.enable = true;
      telescope = {
        enable = true;
        extensions = {
          file-browser.enable = true;
          undo.enable = true;
        };
      };
      todo-comments.enable = true;
      web-devicons.enable = true;
      neoconf.enable = true;
      diffview.enable = true;
      instant = {
        enable = true;
        settings.username = "libewa";
      };
      indent-blankline.enable = true;
      neo-tree = {
        enable = true;
      };
      rainbow-delimiters.enable = true;
    };
    extraPackages = with pkgs; [
      ripgrep
      fd
    ];
    colorschemes.catppuccin = {
      enable = true;
      settings = {
        flavour = "mocha";
        transparent_background = true;
      };
    };
    clipboard.providers.wl-copy.enable = true;
    extraConfigVim = builtins.readFile ../dotfiles/nvim/init.vim;
    withNodeJs = true;
  };
}
