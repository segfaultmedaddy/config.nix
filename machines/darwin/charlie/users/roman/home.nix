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

  programs.zsh.shellAliases = {
    delta = "limactl shell delta";
  };

  home.packages = with pkgs; [
    # vm
    lima

    # zed tools for iOS
    xcode-build-server

    # Ethereum tools
    foundry
    # cryo
  ];
}
