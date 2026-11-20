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

  home.packages = with pkgs; [
    postgresql # only for psql
    nixd # nix lsp
    nixfmt
    typst # like latex but better
    gcx # grafana cloud cli
    rust-bin.stable.latest.default # rust
    dartpkgs.stable # dart
    zigpkgs.default # zig
    lane # copy-on-write worktrees; backs the opencode-plugin-lane worktree strategy
  ];

  programs.rtk = {
    enable = true;
    opencode.enable = true;
    settings.tee.mode = "failures";
  };

  programs.opencode2 = {
    # The Git strategy is built in; Lane is still needed for copy-on-write worktrees.
    settings.plugins = [
      {
        package = "git+https://github.com/anomalyco/opencode-plugin-lane.git";
        options.executable = "${pkgs.lane}/bin/lane";
      }
    ];
    cli.settings = {
      theme = {
        name = "rosepine";
        mode = "dark";
      };
      session.sidebar = "hide";
      tabs.mode = "off";
    };
  };

  imports = [
    ../theme.nix
    ../opencode.nix
    ../rex/home.nix
    ../kube/home.nix
    ../tf.nix
    ../shell.nix
    ../rtk.nix
    ../git.nix
    ../nvim/home.nix
    ../node.nix
    ../go.nix
    ../grpc.nix
    ../lane.nix
  ];
}
