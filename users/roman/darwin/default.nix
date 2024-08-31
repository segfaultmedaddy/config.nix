# This file is an entry to the system settings.

{ pkgs, ... }: {
  users.users.roman = {
    home = "/Users/roman";
    shell = pkgs.zsh;
  };
}
