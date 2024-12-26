{ pkgs, ... }:
{
  home.packages = with pkgs; [
    colima
    docker-client
    kubectl
    kubectx
  ];

  programs.zsh.shellAliases = {
    nerd = "colima nerdctl";
    nerdctl = "colima nerdctl";
    necu = "colima nerdctl compose up";
    necd = "colima nerdctl compose down";
    necr = "colima nerdctl compose";
  };
}
