{ ... }:
{
  home.stateVersion = "24.11";

  home.sessionVariables = {
    CONFIG_ROOT_DIR = "$HOME/dev/personal/config.nix";
  };

  programs.git = {
    userName = "Roman Vanesyan";
    userEmail = "roman@vanesyan.com";
  };
}
