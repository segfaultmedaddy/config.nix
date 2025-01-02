{ pkgs, ... }:
{
  users.users.roman = {
    shell = pkgs.zsh;
  };

  homebrew.casks = [
    "transmission"
    "android-studio"
    "obsidian"
    "linear-linear" # linear.app
    "notion"
  ];
}
