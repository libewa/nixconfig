{ config, ... }: {
  programs.btop = {
    enable = true;
    settings = {
      color_theme = "${config.programs.btop.package}/share/btop/themes/dusklight.theme";
      rounded_corners = true;
      shown_boxes = "cpu mem net proc";
      cpu_single_graph = true;
      cpu_invert_lower = true;
      show_swap = true;
      swap_disk = true;
    };
  };
}
