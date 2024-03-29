# This file is an entry point for the home-manager for a specified user.

{ lib, pkgs, ... }: {
  home.stateVersion = "23.11";

  home.packages = with pkgs; [
    nixd
    nixpkgs-fmt
    nixpkgs-review
    gleam # fancy programming language
  ]; 

  programs.zsh.shellAliases = {
    # TODO: make configurable 
    switch = "nix run nix-darwin -- switch --flake .#macbook-pro-i7";
  };

  programs.awscli.enable = true;

  programs.ssh = {
    enable = true;
    # I use 1password for storing my SSH key. 1password is installed via
    # homebrew.
    extraConfig = ''
      Host *
        IdentityAgent "/Users/roman/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
    '';
  };
}

