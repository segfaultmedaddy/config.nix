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

  # Preserve true-color rendering in terminal apps, including over SSH.
  home.sessionVariables.COLORTERM = "truecolor";

  programs.zsh = {
    shellAliases = {
      nix-switch-system = "cd $CONFIG_ROOT_DIR && nixos-rebuild switch --flake .#${machine} --impure --sudo";
      nix-boot-system = "cd $CONFIG_ROOT_DIR && nixos-rebuild boot --flake .#${machine} --impure --sudo";
      nix-update-system = "cd $CONFIG_ROOT_DIR && nix flake update && cd -";
    };
  };
}
