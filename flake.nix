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
  };

  outputs = inputs@{ self, nixpkgs, darwin, agenix, home-manager, nix-index-database, ... }:
    let
      system = "x86_64-darwin";
      machine = "macbook-pro-i7";
      user = "roman";
    in
    {
      darwinConfigurations.${machine} = darwin.lib.darwinSystem {
        inherit system;

        modules = [
          ./machines/darwin
          ./machines/darwin/${machine}
          ./users/${user}/darwin
          ./modules/db/darwin.nix
          ./modules/xcode/darwin.nix
          ./modules/font/darwin.nix
          ./modules/ruby/darwin.nix
          ./modules/flow/darwin.nix
          ./modules/android-studio/darwin.nix
          ./modules/tailscale/darwin.nix
          ./modules/wezterm/darwin.nix
          ./modules/1password/darwin
          ./modules/lightroom/darwin.nix
          ./modules/zed/darwin.nix
          ./modules/aerospace/darwin.nix
          agenix.darwinModules.default
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit user system machine; };
            home-manager.users.${user} = {
              imports = [
                ./users/${user}/darwin/home.nix
                ./machines/darwin/${machine}/home.nix
                ./modules/btop.nix
                ./modules/lima.nix
                ./modules/nvim
                ./modules/home
                ./modules/wezterm
                ./modules/aerospace
                # ./modules/zed
                ./modules/db/home.nix
                ./modules/go.nix
                ./modules/node.nix
                ./modules/tf.nix
                ./modules/grpc.nix
                ./modules/git.nix
                ./modules/fd.nix
                ./modules/shell.nix
                ./modules/ruby/home.nix
                ./modules/1password/darwin/home.nix
                ./modules/lazygit.nix
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

      darwinPackages = self.darwinConfigurations.${machine}.pkgs;
      formatter.${system} = nixpkgs.legacyPackages.${system}.nixpkgs-fmt;
    };
}
