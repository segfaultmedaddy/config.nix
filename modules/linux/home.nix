{
  machine,
  inputs,
  ...
}:
{
  imports = [
    ../home
    inputs.rex-config.inputs.rex.homeManagerModules.default
  ];

  # Keep the personal server running under the same account as Rex sessions.
  services.rex.enable = true;

  programs.zsh = {
    shellAliases = {
      nix-switch-system = "cd $CONFIG_ROOT_DIR && sudo nixos-rebuild switch --flake .#${machine} --impure";
      nix-boot-system = "cd $CONFIG_ROOT_DIR && sudo nixos-rebuild boot --flake .#${machine} --impure";
      nix-update-system = "cd $CONFIG_ROOT_DIR && nix flake update && cd -";
    };
  };
}
