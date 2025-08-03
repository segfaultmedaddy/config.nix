{
  system,
  isVM ? true,
}:
{
  user,
  machine,
  inputs,
}:
let
  defaultConfig = import ../../modules/linux/default.nix {
    inherit
      system
      inputs
      user
      machine
      isVM
      ;
  };
in
inputs.nixpkgs.lib.nixosSystem {
  inherit system;
  modules = [
    defaultConfig
    ./${machine}

    {
      home-manager.users.${user} = {
        imports = [
          ./${machine}/users/${user}/home.nix
        ];
      };
    }
  ];
}
