{
  pkgs,
  lib,
  palette,
}:
pkgs.writeText "neovim-monochrome-palette.lua" ''
  return ${lib.generators.toLua { } palette}
''
