{ lib, pkgs, ... }:
{
  home.file."./.config/rex/init.lua".source = ./init.lua;

  programs.zsh.shellAliases.rex = lib.mkIf pkgs.stdenv.hostPlatform.isDarwin ''
    "$HOME/Library/Application Support/com.superlogical.rex/RexServer/Versions/Current/Rex Server.app/Contents/MacOS/rex"'';
}
