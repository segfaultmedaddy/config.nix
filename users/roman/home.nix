# This file is an entry point for the home-manager for a specified user.

{ pkgs, ... }: {
  home.stateVersion = "23.11";

  # Tell home-manager to manage itself.
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    go
  ];

  # Load environment variables from $(cwd)/.env
  # see https://direnv.net/
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set -g SHELL ${pkgs.fish}/bin/fish
    '';
  };

  programs.htop.enable = true;
  programs.awscli.enable = true;
}
