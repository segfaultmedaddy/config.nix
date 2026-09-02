{ pkgs, ... }:
{
  imports = [ ];

  home.stateVersion = "26.05";

  home.sessionVariables = {
    CONFIG_ROOT_DIR = "$HOME/dev/segfaultmedaddy/config.nix";
  };

  programs.git = {
    settings.user.name = "Roman";
  };

  home.packages = with pkgs; [
    colima

    # Cloud
    (google-cloud-sdk.withExtraComponents (
      with google-cloud-sdk.components;
      [
        gke-gcloud-auth-plugin
      ]
    ))
  ];
}
