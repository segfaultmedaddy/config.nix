{ user, inputs, ... }:
{ pkgs, lib, ... }:
{
  system.stateVersion = "25.11";

  nixpkgs.overlays = lib.mkAfter [
    (final: _prev: {
      devenv = inputs.nixpkgs.legacyPackages.${final.stdenv.hostPlatform.system}.devenv;
    })
  ];

  users.users.${user} = {
    shell = pkgs.zsh;
  };

  # zsh is my primary shell on macOS and since I run lima vm on it, I use
  # zsh as default shell on Linux for convenience.
  programs.zsh = {
    enable = true;
  };

  environment.shells = with pkgs; [
    bashInteractive
    zsh
  ];

  imports = [ ];
}
