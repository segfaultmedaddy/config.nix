{ config, pkgs, ... }: {
  home.packages = with pkgs; [
    golangci-lint
    golines
  ];

  programs.zsh.shellAliases = {
    nerd = "lima nerdctl";
    nerdctl = "lima nerdctl";
  };

  programs.zsh.initExtra = ''
    eval "$(${pkgs.fnm}/bin/fnm env --use-on-cd)"
  '';

  programs.go = {
    enable = true;
    goPath = "go";
    package = pkgs.go_1_22;
  };

  home.sessionPath = [
    "$HOME/go/bin"
  ];
}
