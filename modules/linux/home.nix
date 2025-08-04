{
  ...
}:
{
  imports = [
    ../home
  ];

  programs.zsh = {
    shellAliases = {
      # TODO: adapt for linux/VM
      # nix-switch-system = "cd $CONFIG_ROOT_DIR && sudo darwin-rebuild switch --flake .#${machine}";
    };
  };
}
