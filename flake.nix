{
  description = "Roman's dotfiles";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    darwin = {
      url = "github:LnL7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-utils = {
      url = "github:numtide/flake-utils";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dart.url = "github:segfaultmedaddy/dart-overlay";

    rust = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    naersk = {
      url = "github:nix-community/naersk";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    lima = {
      url = "github:nixos-lima/nixos-lima/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    opencode = {
      url = "github:anomalyco/opencode/dev";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-clawdbot = {
      url = "github:moltbot/nix-clawdbot";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { ... }@inputs:
    let
      tailscaleAddr = "tail61e33.ts.net";
      mkDarwinX64System = import ./machines/darwin/mkSystem.nix {
        system = "x86_64-darwin";
      };
      mkDarwinAarch64System = import ./machines/darwin/mkSystem.nix {
        system = "aarch64-darwin";
      };
      mkLimaVMSystem = import ./machines/linux/mkSystem.nix {
        system = "aarch64-linux";
        isLima = true;
      };
      mkLinuxX64System = import ./machines/linux/mkSystem.nix {
        system = "x86_64-linux";
      };
    in
    inputs.flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import inputs.nixpkgs { inherit system; };
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            # Tooling
            just
            typos
            lefthook
          ];
        };

        formatter = pkgs.nixfmt;
      }
    )
    // {
      darwinConfigurations."macbook-pro-i7" = mkDarwinX64System {
        inherit inputs;
        machine = "alpha";
        user = "roman";
      };

      darwinConfigurations."bravo" = mkDarwinAarch64System {
        inherit inputs;
        machine = "bravo";
        user = "roman";
      };

      darwinConfigurations."charlie" = mkDarwinAarch64System {
        inherit inputs;
        machine = "charlie";
        user = "roman";
      };

      # delta is nixos running in lima.
      nixosConfigurations."delta" = mkLimaVMSystem {
        inherit inputs;

        machine = "delta";
        user = "roman";
      };

      nixosConfigurations."echo" = mkLinuxX64System {
        inherit inputs tailscaleAddr;

        machine = "echo";
        user = "roman";

        sshAuthorizedKeys = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAII81uV+mVwAaq64WPaURa8sX0X7+nurd/7ya2O3Zvfe3 roman@vanesyan.com"
        ];
      };
    };
}
