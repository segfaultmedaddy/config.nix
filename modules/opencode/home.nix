{ pkgs, ... }:
let
  palette = import ../theme/palette.nix;
  theme = import ../theme/opencode.nix { inherit pkgs palette; };
in
{
  home.file."./.config/opencode/tui.json".source = ./config/opencode/tui.json;
  home.file."./.config/opencode/themes/monochrome.json".source = theme;
}
