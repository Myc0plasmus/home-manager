{
  config,
  pkgs,
  ...
}:

{
  stylix.enable = true;
  stylix.base16Scheme = {
    base00 = "#000000";
    base01 = "#21262d";
    base02 = "#30363d";
    base03 = "#484f58";
    base04 = "#8b949e";
    base05 = "#b1bac4";
    base06 = "#c9d1d9";
    base07 = "#f0f6fc";
    base08 = "#b00404";
    base09 = "#f0883e";
    base0A = "#d29922";
    base0B = "#3fb950";
    base0C = "#a5d6ff";
    base0D = "#b00404";
    base0E = "#ff7b72";
    base0F = "#bd561d";
  };

  stylix.targets = {
    nixvim.enable = false;
  };
}
