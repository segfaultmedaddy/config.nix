# Home contains all the configurations for the home-manager.
# It supposed to be system independent.
# If system dependent configuration is needed,
# put it under modules/<system>/home.nix
{ pkgs, ... }:
{
  # Tell home-manager to manage itself.
  programs.home-manager.enable = true;

  home.sessionVariables = {
    LC_ALL = "en_US.UTF-8";
    LC_CTYPE = "en_US.UTF-8";
  };

  imports = [
    ../git.nix
    ../nvim/home.nix
    ../shell.nix

    ../node.nix
    ../go.nix
    ../grpc.nix
    ../tf.nix
  ];

  home.packages = with pkgs; [
    typst # like latex but better
    ffmpeg-full

    # Languages
    pkgs.rust-bin.stable.latest.default
    pkgs.dartpkgs.stable
    nixd
    nixfmt-rfc-style

    # Cloud
    kubectl
    kubectx
    (google-cloud-sdk.withExtraComponents (
      with google-cloud-sdk.components;
      [
        # plugins if any
      ]
    ))
  ];

  programs.awscli.enable = true;
}
