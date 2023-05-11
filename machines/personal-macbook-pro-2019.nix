{ pkgs, ... }: {
  # Nix is installed using a separate installed so tell nix-darwin not to manage it for us.
  nix.useDaemon = true;

  programs.zsh.enable = true;
  programs.neovim.enable = true;
}
