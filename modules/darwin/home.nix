{
  machine,
  user,
  pkgs,
  ...
}:
let
  homebrewPrefix = (
    if pkgs.stdenv.hostPlatform.system == "aarch64-darwin" then "/opt/homebrew" else "/usr/local"
  );
in
{
  imports = [
    ../home

    ../1password/darwin/home.nix
    ../aerospace/home.nix
    ../wezterm/home.nix

    # ../zed/home.nix
  ];

  home.homeDirectory = "/Users/${user}";

  programs.zsh = {
    initContent = ''
      eval "$(${homebrewPrefix}/bin/brew shellenv)"
    '';
    shellAliases = {
      nix-switch-system = "cd $CONFIG_ROOT_DIR && sudo darwin-rebuild switch --flake .#${machine}";
      nix-update-system = "cd $CONFIG_ROOT_DIR && nix flake update && cd -";
      cat = "bat";
      htop = "btop";
      top = "btop";
    };
  };

  programs.awscli.enable = true;
}
