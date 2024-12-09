{ pkgs, ... }:
{
  home.packages = with pkgs; [
    asciinema
    asciinema-agg # convert ascii scene to gif
  ];
}
