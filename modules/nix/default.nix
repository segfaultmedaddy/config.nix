{ isDarwin }:
{
  user,
  machine,
  system,
  inputs,
}:
{ ... }:
{
  nixpkgs = {
    config.allowUnfree = true;
    overlays = [
      inputs.dart.overlays.default
      (import inputs.rust)
    ]
    ++ (import ../../lib/overlays.nix { inherit (inputs) naersk; });
    hostPlatform = "${system}";
  };

  nix.settings.experimental-features = ''
    nix-command flakes
  '';

  imports = [
    (if isDarwin then inputs.agenix.darwinModules.default else inputs.agenix.nixosModules.default)
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
        inherit system machine user;
      };

      home-manager.users.${user} = {
        imports = [
          inputs.nix-index-database.homeModules.nix-index
          inputs.agenix.homeManagerModules.default
        ];
      };
    }
  ];
}
