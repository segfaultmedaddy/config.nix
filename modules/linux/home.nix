{
  machine,
  user,
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    ../home
    ../herdr.nix
  ];

  home.homeDirectory = "/home/${user}";

  programs.herdr = {
    enable = true;
    package = inputs.llm-agents.packages.${pkgs.stdenv.hostPlatform.system}.herdr;
    opencode.enable = true;
  };

  programs.zsh = {
    shellAliases = {
      nix-switch-system = "cd $CONFIG_ROOT_DIR && sudo nixos-rebuild switch --flake .#${machine} --impure";
      nix-boot-system = "cd $CONFIG_ROOT_DIR && sudo nixos-rebuild boot --flake .#${machine} --impure";
      nix-update-system = "cd $CONFIG_ROOT_DIR && nix flake update && cd -";
    };
  };
}
