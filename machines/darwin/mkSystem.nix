{
  system,
  pkgs,
}:
{
  user,
  machine,
  inputs,
}:
let
  machineConfig = import ./${machine}/default.nix { inherit system pkgs; };
in
inputs.darwin.lib.darwinSystem {
  inherit system;
  modules = [
    {
      nixpkgs.overlays = [
        inputs.dart.overlays.default
        (import inputs.rust)
      ];
      nixpkgs.hostPlatform = "${system}";
    }

    ./default.nix
    machineConfig
    ../../users/${user}/darwin

    # TODO: move to separate modules
    ../../modules/1password/darwin
    ../../modules/aerospace/darwin.nix
    ../../modules/android-studio/darwin.nix
    ../../modules/db/darwin.nix
    ../../modules/estonian-id-card-reader/darwin.nix
    ../../modules/flow/darwin.nix
    ../../modules/font/darwin.nix
    ../../modules/lightroom/darwin.nix
    ../../modules/tailscale/darwin.nix
    ../../modules/wezterm/darwin.nix
    ../../modules/xcode/darwin.nix
    ../../modules/zed/darwin.nix
    ../../modules/corp/darwin.nix

    inputs.agenix.darwinModules.default
    inputs.home-manager.darwinModules.home-manager
    {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.extraSpecialArgs = {
        inherit system machine user;
      };
      home-manager.users.${user} = {
        imports = [
          ./home.nix
          ./${machine}/home.nix
          ../../users/${user}/darwin/home.nix
          inputs.nix-index-database.hmModules.nix-index
          inputs.agenix.homeManagerModules.default

          # TODO: move to separate modules
          ../../modules/1password/darwin/home.nix
          ../../modules/aerospace
          ../../modules/btop.nix
          ../../modules/dart.nix
          ../../modules/db/home.nix
          ../../modules/fd.nix
          ../../modules/git.nix
          ../../modules/go.nix
          ../../modules/grpc.nix
          ../../modules/home
          ../../modules/lazygit.nix
          ../../modules/colima.nix
          ../../modules/node.nix
          ../../modules/nvim
          ../../modules/shell.nix
          ../../modules/tf.nix
          ../../modules/typst.nix
          ../../modules/wezterm
          # ../../modules/zed
          ../../modules/asciinema.nix
          ../../modules/ffmpeg.nix
        ];
      };
    }
  ];
}
