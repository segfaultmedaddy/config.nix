{ pkgs, ... }: {
  home.packages = with pkgs; [
    golangci-lint
    golines
  ];

  programs.go = {
    enable = true;
    goPath = "go";
    package = pkgs.go_1_23;
  };

  home.sessionPath = [
    "$HOME/go/bin"
  ];
}
