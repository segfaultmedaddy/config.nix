{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    extraPackages = with pkgs; [
      gcc # tree-sitter dep.
      ripgrep # telescope dep.
      fzf # telescope dep.
      fd # telescope dep.
      tree-sitter
    ];
  };

  home.packages = with pkgs; [
    stylua
    ruff
  ];

  home.file."./.config/nvim/" = {
    source = ./config;
    recursive = true;
  };
}
