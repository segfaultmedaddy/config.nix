{ pkgs, ... }:
{
  home.packages = with pkgs; [
    colima
  ];

  programs.zsh.shellAliases = {
    nerd = "colima nerdctl";
    nerdctl = "colima nerdctl";
    necu = "colima nerdctl compose up";
    necd = "colima nerdctl compose down";
    necr = "colima nerdctl compose";
  };
}