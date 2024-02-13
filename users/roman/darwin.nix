# This file is an entry to all macOS specific settings, programs, etc.

{ config, pkgs, ... }: {
  # homebrew = {
  #   enable = true;
  #   casks = [
  #   "google-chrome"
  #   "discord"
  #   ];
  # };

  users.users.roman = {
    home = "/Users/roman";
    shell = pkgs.fish;
  };
}
