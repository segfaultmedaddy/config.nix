{
  machine,
  user,
  ...
}:
{
  imports = [
    ../home
  ];

  home.homeDirectory = "/home/${user}";

  programs.zsh = {
    shellAliases = {
      nix-switch-system = "cd $CONFIG_ROOT_DIR && sudo nixos-rebuild switch --flake .#${machine} --impure";
      nix-update-system = "cd $CONFIG_ROOT_DIR && nix flake update && cd -";
    };
  };
}
