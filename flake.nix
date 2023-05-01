{
  description = "NixOS config for Roman's macOs machines";
  inputs = {
    nixpkg.url = "github:nixos/nixpkgs/nixos-22.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-22.11";
      # use the same set of nixpkgs as system.
      inputs.nixpkgs.follows = "nixpkgs";
    };

    darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    neovim-nightly-overlay = {
      url = "github:nix-community/neovim-nightly-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, home-manager, darwin, ... }:
    let
      mkDarwin = import ./lib/mk-darwin.nix;
      overlays = [ inputs.neovim-nightly-overlay.overlay ];
    in
    {
      darwinConfigurations.personal-macbook-pro-2019 = mkDarwin "personal-macbook-pro-2019" {
        inherit overlays nixpkgs darwin home-manager;

        system = "x86_64-darwin";
        user = "roman";
      };

      formatter.x86_64-darwin = nixpkgs.legacyPackages.x86_64-darwin.nixpkgs-fmt;
    };
}
