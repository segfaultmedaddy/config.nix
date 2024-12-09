{
  description = "Roman's dotfiles";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # nixd requires it to support flake installations.
    flake-compat = {
      url = "https://flakehub.com/f/edolstra/flake-compat/1.tar.gz";
    };

    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dart.url = "github:roman-vanesyan/dart-overlay";

    rust = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      darwin,
      agenix,
      home-manager,
      nix-index-database,
      ...
    }:
    let
      system = "x86_64-darwin";
      machine = "macbook-pro-i7";
      user = "roman";
      pkgs = import nixpkgs { inherit system; };
    in
    {
      darwinConfigurations.${machine} = darwin.lib.darwinSystem {
        inherit system;

        modules = [
          {
            nixpkgs.overlays = [
              inputs.dart.overlays.default
              (import inputs.rust)
            ];
          }
          ./machines/darwin
          ./machines/darwin/${machine}
          ./users/${user}/darwin
          ./modules/1password/darwin
          ./modules/aerospace/darwin.nix
          ./modules/android-studio/darwin.nix
          ./modules/db/darwin.nix
          ./modules/estonian-id-card-reader/darwin.nix
          ./modules/flow/darwin.nix
          ./modules/font/darwin.nix
          ./modules/lightroom/darwin.nix
          ./modules/tailscale/darwin.nix
          ./modules/wezterm/darwin.nix
          ./modules/xcode/darwin.nix
          ./modules/zed/darwin.nix
          ./modules/corp/darwin.nix
          agenix.darwinModules.default
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = {
              inherit user system machine;
            };
            home-manager.users.${user} = {
              imports = [
                ./users/${user}/darwin/home.nix
                ./machines/darwin/${machine}/home.nix
                ./modules/1password/darwin/home.nix
                ./modules/aerospace
                ./modules/btop.nix
                ./modules/dart.nix
                ./modules/db/home.nix
                ./modules/fd.nix
                ./modules/git.nix
                ./modules/go.nix
                ./modules/grpc.nix
                ./modules/home
                ./modules/lazygit.nix
                ./modules/colima.nix
                ./modules/node.nix
                ./modules/nvim
                ./modules/shell.nix
                ./modules/tf.nix
                ./modules/typst.nix
                ./modules/wezterm
                # ./modules/zed
                ./modules/asciinema.nix
                ./modules/ffmpeg.nix
                nix-index-database.hmModules.nix-index
                agenix.homeManagerModules.default
              ];
            };
          }
          {
            nixpkgs.hostPlatform = "${system}";
          }
        ];
      };

      formatter.${system} = pkgs.nixfmt-rfc-style;
    };
}
