# Home contains all the configurations for the home-manager.
# It supposed to be OS independent.
# If system dependent configuration is needed,
# put it under modules/<system>/home.nix
{
  pkgs,
  inputs,
  ...
}:
{
  # Tell home-manager to manage itself.
  programs.home-manager.enable = true;

  home.sessionVariables = {
    LC_ALL = "en_US.UTF-8";
    LC_CTYPE = "en_US.UTF-8";
  };

  home.packages = with pkgs; [
    postgresql # only for psql
    nixd # nix lsp
    nixfmt
    typst # like latex but better
    rust-bin.stable.latest.default # rust
    dartpkgs.stable # dart
    zigpkgs.default # zig
    inputs.llm-agents.packages.${pkgs.stdenv.hostPlatform.system}.opencode
  ];

  programs.rtk = {
    enable = true;
    opencode.enable = true;
    settings.tee.mode = "failures";
  };

  programs.herdr = {
    enable = true;
    package = inputs.llm-agents.packages.${pkgs.stdenv.hostPlatform.system}.herdr;
    opencode.enable = true;
  };

  imports = [
    ../herdr.nix
    ../kube/home.nix
    ../tf.nix
    ../shell.nix
    ../rtk.nix
    ../git.nix
    ../nvim/home.nix
    ../node.nix
    ../go.nix
    ../grpc.nix
  ];
}
