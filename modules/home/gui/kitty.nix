{ pkgs, ... }: {
  programs.kitty = {
    enable = true;
    font = {
      package = pkgs.cascadia-code;
      name = "Cascadia Code NF";
    };
  };
}
