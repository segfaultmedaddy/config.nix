{
  system,
  isVM ? false,
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
  machineConfig = import ./${machine} {
    inherit user;
  };
in
inputs.nixpkgs.lib.nixosSystem {
  inherit system;
  modules = [
    defaultConfig
    machineConfig

    (
      if isVM then
        {
          home-manager.extraSpecialArgs = {
            inherit isVM;
            hostUser = user;
          };

          users.users.${user}.home = "/home/${user}.linux";
        }
      else
        {
        }
    )

    {
      home-manager.users.${user} = {
        imports = [
          ./${machine}/users/${user}/home.nix
        ];
      };
    }
  ];
}
