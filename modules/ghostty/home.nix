{ pkgs, lib, ... }:
let
  palette = import ../theme/palette.nix;
  theme = import ../theme/ghostty.nix { inherit pkgs lib palette; };
in
{
  home.file."./.config/ghostty/config.ghostty".source = ./config.ghostty;
  home.file."./.config/ghostty/themes/monochrome".source = theme;
}
