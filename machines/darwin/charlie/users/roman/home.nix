{ pkgs, ... }:
{
  imports = [ ];

  home.stateVersion = "24.11";

  home.sessionVariables = {
    CONFIG_ROOT_DIR = "$HOME/dev/personal/config.nix";
  };

  programs.git = {
    settings.user.name = "Roman";
    settings.user.email = "roman@vanesyan.com";
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

    # Cloud
    vault # HashiCorp Vault CLI
    (google-cloud-sdk.withExtraComponents (
      with google-cloud-sdk.components;
      [
        gke-gcloud-auth-plugin
      ]
    ))
  ];
}
