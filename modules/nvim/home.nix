{ pkgs, ... }:
let
  nvimTreesitter = pkgs.vimPlugins.nvim-treesitter.withPlugins (
    parsers: with parsers; [
      css
      dart
      go
      javascript
      lua
      nix
      python
      rust
      svelte
      swift
      templ
      terraform
      tsx
      typescript
    ]
  );
in
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    withRuby = false;
    withPython3 = false;
    plugins = [ nvimTreesitter ];
    extraPackages = with pkgs; [
      cargo-nextest
      curl
      fd
      fzf
      gcc
      gzip
      golangci-lint
      golines
      gopls
      gotools
      gnutar
      lua-language-server
      nixd
      nixfmt
      opentofu
      prettier
      ripgrep
      ruff
      rust-analyzer
      rustfmt
      sql-formatter
      stylua
      svelte-language-server
      swift-format
      swiftlint
      tailwindcss-language-server
      templ
      terraform-ls
      tree-sitter
      typescript-language-server
      unzip
      vscode-langservers-extracted
    ];
  };

  home.packages = with pkgs; [
    ruff
    stylua
  ];

  home.file."./.config/nvim/" = {
    source = ./config;
    recursive = true;
  };
}
