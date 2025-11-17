{ ... }:
{
  home.stateVersion = "23.11";
  home.sessionVariables = {
    CONFIG_ROOT_DIR = "$HOME/dev/personal/config.nix";
  };

  programs.git = {
    settings.user.name = "Roman";
    settings.user.email = "roman@vanesyan.com";
  };
}
