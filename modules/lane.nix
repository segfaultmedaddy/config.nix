{ pkgs, ... }:
{
  programs.zsh.initContent = ''
    eval "$(${pkgs.lane}/bin/lane shellenv)"
  '';
}
