{ pkgs, ... }:
{
  home.packages = with pkgs; [
    fnm # nodejs manager
  ];

  programs.zsh.initContent = ''
    eval "$(${pkgs.fnm}/bin/fnm env --use-on-cd)"
  '';
}
