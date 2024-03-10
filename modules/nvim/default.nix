{ config, pkgs, ... }: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    extraPackages = with pkgs; [
      gcc # tree-sitter dep.
      ripgrep # telescope dep.
      fzf # telescope dep.
    ];
  };

  home.file."./.config/nvim/" = {
    source = ./config;
    recursive = true;
  };
}
