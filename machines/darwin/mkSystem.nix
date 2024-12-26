{
  system,
}:
{
  user,
  machine,
  inputs,
}:
let
  defaultConfig = import ../../modules/darwin/default.nix {
    inherit
      system
      inputs
      user
      machine
      ;
  };
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

    defaultConfig
    ./${machine}
    ../../users/${user}/darwin

    {
      home-manager.users.${user} = {
        imports = [
          ./${machine}/home.nix
          ../../users/${user}/darwin/home.nix
        ];
      };
    }
  ];
}
