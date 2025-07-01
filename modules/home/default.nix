# Home contains all the configurations for the home-manager.
# It supposed to be OS independent.
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
    pdfcpu # pdf manipulation
    ffmpeg-full

    # Languages
    pkgs.rust-bin.stable.latest.default
    pkgs.dartpkgs.stable
    nodejs
    nixd # nix lsp
    nixfmt-rfc-style
    sourcekit-lsp # swift lsp

    # Cloud
    kubernetes-helm
    helm-docs
    kubectl
    kubectx
    vault # HashiCorp Vault CLI
    kubeconform # manifest validator
    (google-cloud-sdk.withExtraComponents (
      with google-cloud-sdk.components;
      [
        gke-gcloud-auth-plugin
      ]
    ))
  ];

  programs.awscli.enable = true;
}
