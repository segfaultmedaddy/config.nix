{ pkgs, machine, ... }:
{
  home.stateVersion = "23.11";

  home.packages = with pkgs; [
    nixd # nix LSP server
    nixfmt-rfc-style # formatter
  ];

  programs.zsh.shellAliases = {
    nix-switch-system = "cd $CONFIG_ROOT_DIR && nix run nix-darwin -- switch --flake .#${machine} && cd -";
    nix-update-system = "cd $CONFIG_ROOT_DIR && nix flake update && cd -";
  };

  programs.ssh.enable = true;
}
