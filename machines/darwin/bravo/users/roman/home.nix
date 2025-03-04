{ pkgs, ... }:
{
  home.stateVersion = "24.11";

  home.packages = with pkgs; [
    pre-commit
  ];

  home.sessionVariables = {
    CONFIG_ROOT_DIR = "$HOME/dev/personal/config.nix";
  };

  programs.git = {
    userName = "Roman Vanesyan";
  };
}
