{
  system,
  isDeterminate,
}:
{
  user,
  machine,
  inputs,
  hasMasSupport ? true,
}:
let
  defaultConfig = import ../../modules/darwin/default.nix {
    inherit
      inputs
      user
      machine
      isDeterminate
      hasMasSupport
      ;
  };

  machineConfig = import ./${machine} {
    inherit inputs;
  };
in
inputs.darwin.lib.darwinSystem {
  modules = [
    { nixpkgs.hostPlatform.system = system; }

    defaultConfig
    machineConfig

    {
      # Install rosetta.
      system.activationScripts.extraActivation.text = ''
        softwareupdate --install-rosetta --agree-to-license > /dev/null 2>&1
      '';
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
