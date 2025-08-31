{ user }:
{ pkgs, ... }:
{
  system.stateVersion = "25.11";

  users.users.${user} = {
    shell = pkgs.bash;
  };

  environment.shells = with pkgs; [
    bashInteractive
  ];

  imports = [ ];
}
