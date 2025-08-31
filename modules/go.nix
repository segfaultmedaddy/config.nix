{ pkgs, ... }:
{
  programs.go = {
    enable = true;
    goPath = "go";
    package = pkgs.go;
  };

  home.sessionPath = [
    "$HOME/go/bin"
  ];
}
