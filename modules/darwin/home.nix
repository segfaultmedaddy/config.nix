{ machine, system, ... }:
let
  homebrewPrefix = (if system == "aarch64-darwin" then "/opt/homebrew" else "/usr/local");
in
{
  imports = [
    ../home
    ../1password/darwin/home.nix
    ../aerospace/home.nix
    ../wezterm/home.nix
    # ../zed/home.nix
  ];

  programs.zsh = {
    initContent = ''
      eval "$(${homebrewPrefix}/bin/brew shellenv)"
    '';
    shellAliases = {
      nix-switch-system = "cd $CONFIG_ROOT_DIR && sudo darwin-rebuild switch --flake .#${machine}";
      nix-update-system = "cd $CONFIG_ROOT_DIR && nix flake update && cd -";
    };
  };
}
