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

    (
      if system == "aarch64-darwin" then
        {
          # Install rosetta.
          system.activationScripts.extraActivation.text = ''
            softwareupdate --install-rosetta --agree-to-license
          '';
        }
      else
        { }
    )

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
