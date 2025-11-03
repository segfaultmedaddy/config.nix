{ pkgs, ... }:
{
  programs.go = {
    enable = true;
    env.GOPATH = "$HOME/go";
    package = pkgs.go;
  };

  home.sessionPath = [
    "$HOME/go/bin"
  ];
}
