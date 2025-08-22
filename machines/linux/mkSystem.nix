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
            hostUser = user;
          };
        }
      else
        { }
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
