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
    defaultConfig
    ./${machine}

    {
      networking.hostName = "${machine}";
      users.users.${user} = {
        home = "/Users/${user}";
      };
    }

    ./${machine}/users/${user}/darwin.nix

    {
      home-manager.users.${user} = {
        imports = [
          ./${machine}/users/${user}/home.nix
        ];
      };
    }
  ];
}
