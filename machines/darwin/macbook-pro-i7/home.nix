{ ... }: {
  home.sessionVariables = {
    CONFIG_ROOT_DIR="$HOME/dev/personal/config.nix";
  };

  programs.awscli.enable = true;
}
