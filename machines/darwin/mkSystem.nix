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
      inputs
      user
      machine
      ;
  };
in
inputs.darwin.lib.darwinSystem {
  modules = [
    { nixpkgs.hostPlatform = system; }
    defaultConfig
    ./${machine}

    (
      if system == "aarch64-darwin" then
        {
          # Install rosetta.
          system.activationScripts.extraActivation.text = ''
            softwareupdate --install-rosetta --agree-to-license > /dev/null 2>&1
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
