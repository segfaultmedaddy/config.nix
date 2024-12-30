{ useColima }:
{ pkgs, ... }:
{
  home.packages =
    with pkgs;
    [
      kubectl
      kubectx
    ]
    ++ (
      if useColima then
        [
          colima
          docker-compose
          docker-client
        ]
      else
        [ ]
    );

  programs.zsh.shellAliases = {
    nerd = "colima nerdctl";
    nerdctl = "colima nerdctl";
    necu = "colima nerdctl compose up";
    necd = "colima nerdctl compose down";
    necr = "colima nerdctl compose";
  };
}
