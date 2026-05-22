{ ... }:
{
  home.stateVersion = "25.11";
  home.sessionVariables = {
    CONFIG_ROOT_DIR = "$HOME/dev/segfaultmedaddy/config.nix";
  };

  programs.git = {
    settings.user.name = "Roman";
    settings.user.email = "roman@vanesyan.com";
  };
}
