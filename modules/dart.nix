{ pkgs, ... }:
{
  home.packages = with pkgs; [
    dartpkgs.stable
  ];
}
