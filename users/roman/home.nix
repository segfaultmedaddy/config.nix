# This file is an entry point for the home-manager for a specified user.

{ lib, pkgs, ... }: {
  home.stateVersion = "23.11";

  home.packages = with pkgs; [
    nixd
    nixpkgs-fmt
    nixpkgs-review
  ];

  programs.zsh.shellAliases = {
    # TODO: make configurable
    switch = "nix run nix-darwin -- switch --flake .#macbook-pro-i7";
  };

  programs.awscli.enable = true;
  programs.ssh.enable = true;
}
