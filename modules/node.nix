{ config, pkgs, ... }: {
  home.packages = with pkgs; [
    fnm # nodejs manager
  ];

  programs.zsh.shellAliases = {
    nerd = "lima nerdctl";
    nerdctl = "lima nerdctl";
  };

  programs.zsh.initExtra = ''
    eval "$(${pkgs.fnm}/bin/fnm env --use-on-cd)"
  '';
}
