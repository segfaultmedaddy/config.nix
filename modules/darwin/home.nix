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
    ../vicinae/home.nix
  ];

  home.homeDirectory = "/Users/${user}";

  programs.zsh = {
    initContent = ''
      eval "$(${homebrewPrefix}/bin/brew shellenv)"

      nix-switch-system() {
        cd "$CONFIG_ROOT_DIR" || return
        local system_config
        system_config=$(nix build --no-link --print-out-paths ".#darwinConfigurations.${machine}.system") || return
        sudo nix-env -p /nix/var/nix/profiles/system --set "$system_config" || return
        sudo "$system_config/sw/bin/darwin-rebuild" activate
      }
    '';
    shellAliases = {
      nix-update-system = "cd $CONFIG_ROOT_DIR && nix flake update && cd -";
      cat = "bat";
      htop = "btop";
      top = "btop";
    };
  };

  programs.awscli.enable = true;
}
