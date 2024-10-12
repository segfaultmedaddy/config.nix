# This file is an entry point for the home-manager for a specified user.

{ pkgs, machine, ... }:
{
  home.stateVersion = "23.11";

  home.packages = with pkgs; [
    nixd
    nixpkgs-fmt
    nixpkgs-review
  ];

  programs.zsh.shellAliases = {
    nix-switch-system = "cd $CONFIG_ROOT_DIR && nix run nix-darwin -- switch --flake .#${machine} && cd -";
    nix-update-system = "cd $CONFIG_ROOT_DIR && nix flake update && cd -";
  };

  programs.ssh.enable = true;
}
