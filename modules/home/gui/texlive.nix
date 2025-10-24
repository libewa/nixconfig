{pkgs, ...}: {
  home.packages = [
    pkgs.pandoc
    (pkgs.texlive.combine { inherit (pkgs.texlive) scheme-medium cancel blindtext; })
  ];
}
