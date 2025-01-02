{ pkgs, ... }:
{
  users.users.roman = {
    shell = pkgs.zsh;
  };
}
