{config, ...}: {
  programs.nixvim.plugins = {
    dap-lldb.enable = true;
    dap = {
      enable = true;
    };
    dap-ui.enable = true;
  };
}
