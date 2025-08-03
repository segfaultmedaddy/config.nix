{
  machine,
  system,
  pkgs,
  ...
}:
let
  homebrewPrefix = (if system == "aarch64-darwin" then "/opt/homebrew" else "/usr/local");
in
{
  imports = [
    ../home

    ../shell.nix
    ../node.nix
    ../go.nix
    ../grpc.nix
    ../tf.nix

    ../1password/darwin/home.nix
    ../aerospace/home.nix
    ../wezterm/home.nix

    # ../zed/home.nix
  ];

  programs.zsh = {
    initContent = ''
      eval "$(${homebrewPrefix}/bin/brew shellenv)"
    '';
    shellAliases = {
      nix-switch-system = "cd $CONFIG_ROOT_DIR && sudo darwin-rebuild switch --flake .#${machine}";
      nix-update-system = "cd $CONFIG_ROOT_DIR && nix flake update && cd -";
    };
  };

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
