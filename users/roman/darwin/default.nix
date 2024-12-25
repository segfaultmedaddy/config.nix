{ pkgs, ... }:
{
  users.users.roman = {
    home = "/Users/roman";
    shell = pkgs.zsh;
  };
}
