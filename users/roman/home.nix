# This file is an entry point for the home-manager for a specified user.

{ lib, pkgs, ... }: {
  home.stateVersion = "23.11";

  home.packages = with pkgs; [
    # nixd # disabled until bump a new version. see https://github.com/nix-community/nixd/issues/357
    nixpkgs-fmt
    nixpkgs-review
    gleam # fancy programming language

    obsidian
  ] ++ [
    pkgs.apple-sf-mono-font
    # pkgs.dockutil
  ];

  # Load environment variables from $(cwd)/.env
  # see https://direnv.net/
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.zsh = {
    enable = true;
    shellAliases = {
      ll = "ls -la";
      ".." = "cd ..";
      "..." = "cd ../..";

      # TODO: make configurable 
      switch = "nix run nix-darwin -- switch --flake .#macbook-pro-i7";
    };

    history = {
      size = 3000;
      save = 3000;
      ignoreDups = true;
      ignoreAllDups = true;
      ignoreSpace = true;
      expireDuplicatesFirst = true;
      share = true;
    };

    syntaxHighlighting = {
      enable = true;
      highlighters = [ "main" "brackets" ];
    };
  };

  programs.starship = {
    enable = true;
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.navi = {
    enable = true;
    enableZshIntegration = true;
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
  home.sessionVariables = { };

  home.sessionPath = [ ];
}
