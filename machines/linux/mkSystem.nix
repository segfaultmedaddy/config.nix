{
  system,
  isLima ? false,
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
      inputs
      user
      machine
      isLima
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
  modules = [
    { nixpkgs.hostPlatform = system; }
    defaultConfig
    machineConfig
    (import ../../secrets/default.nix { inherit inputs; })

    (
      if isLima then
        {
          home-manager.extraSpecialArgs = {
            inherit isLima;
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
