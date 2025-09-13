{
  isLima,
  user,
  machine,
  system,
  inputs,
  ...
}:
{ lib, ... }:
{
  imports = [
    (import ../nix/default.nix { isDarwin = false; } {
      inherit
        system
        inputs
        user
        machine
        ;
    })

    (if isLima then inputs.lima.nixosModules.lima else { })
    (
      if isLima then
        (import ./lima.nix)
      else
        {
          imports = [
            # Include generated hardware config.
            # The file must be available after the system installation.
            /etc/nixos/hardware-configuration.nix
          ];

          boot.loader.systemd-boot.enable = true;
          boot.loader.efi.canTouchEfiVariables = true;
        }
    )

    {
      nix.gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 30d";
      };

      networking.hostName = "${machine}";
      users.users.${user} = {
        isNormalUser = true;
        home = "/home/${user}";
        extraGroups = [
          "wheel"
          "networkmanager"
        ];
      };

      home-manager.users.${user} = {
        imports = [
          ./home.nix
        ];
      };
    }
  ];
}
