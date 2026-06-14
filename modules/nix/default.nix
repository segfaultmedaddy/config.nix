{ isDarwin }:
{
  user,
  machine,
  inputs,
}:
{ pkgs, ... }:
{
  nixpkgs = {
    config.allowUnfree = true;
    overlays = [
      inputs.dart.overlays.default
      inputs.devenv.overlays.default
      inputs.zig.overlays.default
      (import inputs.rust)
    ]
    ++ (import ../../lib/overlays.nix { inherit (inputs) naersk; });
  };

  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    extra-substituters = [ "https://devenv.cachix.org" ];
    extra-trusted-public-keys = [ "devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw=" ];
  };

  imports = [
    (if isDarwin then inputs.agenix.darwinModules.default else inputs.agenix.nixosModules.default)

    (import ../../secrets)

    {
      environment.systemPackages = [
        inputs.agenix.packages.${pkgs.stdenv.hostPlatform.system}.default # tool to encrypt content
      ];
    }

    (
      if isDarwin then
        inputs.home-manager.darwinModules.home-manager
      else
        inputs.home-manager.nixosModules.home-manager
    )

    {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.extraSpecialArgs = {
        inherit
          machine
          user
          inputs
          isDarwin
          ;
      };

      home-manager.users.${user} = {
        imports = [
          inputs.nix-index-database.homeModules.nix-index
        ];
      };
    }
  ];
}
