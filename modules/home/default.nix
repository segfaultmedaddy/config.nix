# Home contains all the configurations for the home-manager.
# It supposed to be OS independent.
# If system dependent configuration is needed,
# put it under modules/<system>/home.nix
{ ... }:
{
  # Tell home-manager to manage itself.
  programs.home-manager.enable = true;

  home.sessionVariables = {
    LC_ALL = "en_US.UTF-8";
    LC_CTYPE = "en_US.UTF-8";
  };

  imports = [
    ../kube/home.nix
    ../tf.nix
    ../shell.nix
    ../git.nix
    ../nvim/home.nix
  ];
}
