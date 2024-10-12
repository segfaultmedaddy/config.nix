{ pkgs, ... }:
{
  home.packages = with pkgs; [
    fnm # nodejs manager
  ];

  programs.zsh.initExtra = ''
    eval "$(${pkgs.fnm}/bin/fnm env --use-on-cd)"
  '';
}
