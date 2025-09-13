{
  machine,
  ...
}:
{
  imports = [
    ../home
  ];

  programs.zsh = {
    shellAliases = {
      nix-switch-system = "cd $CONFIG_ROOT_DIR && sudo nixos-rebuild boot --flake .#${machine} --impure";
    };
  };
}
