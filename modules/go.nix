{ config, pkgs, ... }: {
  home.packages = with pkgs; [
    golangci-lint
    golines
  ];

  programs.go = {
    enable = true;
    goPath = "go";
    package = pkgs.go_1_22;
  };

  home.sessionPath = [
    "$HOME/go/bin"
  ];
}
