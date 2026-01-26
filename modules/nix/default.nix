{ isDarwin }:
{
  user,
  machine,
  system,
  inputs,
}:
{ pkgs, ... }:
{
  nixpkgs = {
    config.allowUnfree = true;
    overlays = [
      inputs.dart.overlays.default
      (import inputs.rust)
      inputs.nix-clawdbot.overlays.default
    ]
    ++ (import ../../lib/overlays.nix { inherit (inputs) naersk; });
  };

  nix.settings.experimental-features = ''
    nix-command flakes
  '';

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
          system
          machine
          user
          inputs
          isDarwin
          ;
      };

      home-manager.users.${user} = {
        imports = [
          inputs.nix-index-database.homeModules.nix-index
          inputs.nix-clawdbot.homeManagerModules.clawdbot
        ];
      };
    }
  ];
}
