{ user }:
{ pkgs, ... }:
{
  system.stateVersion = "25.05";

  users.users.${user} = {
    shell = pkgs.bash;
  };

  environment.shells = with pkgs; [
    bashInteractive
  ];

  networking.networkmanager.enable = true;
  services.getty.autologinUser = "${user}";
}
