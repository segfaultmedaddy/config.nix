{ pkgs, config, ... }:
{
  programs.go = {
    enable = true;
    env.GOPATH = "${config.home.homeDirectory}/go";
    package = pkgs.go;
  };

  home.sessionPath = [
    "${config.home.homeDirectory}/go/bin"
  ];
}
