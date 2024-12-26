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
      nixpkgs,
      ...
    }:
    let
      mkDarwinX64System = import ./machines/darwin/mkSystem.nix {
        system = "x86_64-darwin";
      };
    in
    {
      darwinConfigurations."macbook-pro-i7" = mkDarwinX64System {
        inherit inputs;
        machine = "macbook-pro-i7";
        user = "roman";
      };
    };
}
