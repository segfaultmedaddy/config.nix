{ machine, ... }:
{
  imports = [
    ../home
    ../1password/darwin/home.nix
    ../aerospace/home.nix
    ../wezterm/home.nix
    # ../zed/home.nix
  ];

  programs.zsh.shellAliases = {
    nix-switch-system = "cd $CONFIG_ROOT_DIR && nix run nix-darwin -- switch --flake .#${machine} && cd -";
    nix-update-system = "cd $CONFIG_ROOT_DIR && nix flake update && cd -";
  };
}
