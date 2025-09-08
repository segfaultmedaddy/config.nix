{
  system,
  isVM ? false,
}:
{
  user,
  machine,
  inputs,
  sshAuthorizedKeys ? [ ],
  tailscaleAddr ? "",
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
    inherit
      user
      sshAuthorizedKeys
      tailscaleAddr
      ;
  };
in
inputs.nixpkgs.lib.nixosSystem {
  inherit system;
  modules = [
    defaultConfig
    machineConfig
    (import ../../secrets/default.nix { inherit inputs; })

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
          age.identityPaths = [ "/etc/ssh/${machine}-agenix-key" ];
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
