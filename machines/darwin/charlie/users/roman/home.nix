{ pkgs, ... }:
{
  home.stateVersion = "24.11";

  home.sessionVariables = {
    CONFIG_ROOT_DIR = "$HOME/dev/personal/config.nix";
  };

  programs.git = {
    userName = "Roman Vanesyan";
    userEmail = "roman@vanesyan.com";
  };

  home.packages = with pkgs; [
    # vm
    utm
    xcode-build-server
    lima

    # Ethereum tools
    foundry
    # cryo
  ];
}
