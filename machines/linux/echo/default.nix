{
  user,
  sshAuthorizedKeys,
  inputs,
  ...
}:
{ pkgs, ... }:
rec {
  system.stateVersion = "25.05";

  imports = [
    ../../../modules/home-assistant
    inputs.rex-config.inputs.rex.nixosModules.default
  ];

  users.users.${user} = {
    shell = pkgs.zsh;
    openssh.authorizedKeys.keys = sshAuthorizedKeys;
    extraGroups = [ "docker" ];
  };

  programs.zsh = {
    enable = true;
  };

  environment.shells = with pkgs; [
    bashInteractive
    zsh
  ];

  # Install tailscale
  environment.systemPackages = with pkgs; [ tailscale ];

  networking.networkmanager.enable = true;
  services.getty.autologinUser = "${user}";

  services.resolved.enable = true;
  services.tailscale = {
    enable = true;
    package = pkgs.tailscale;
    port = 41641; # default port of tailscale.
    useRoutingFeatures = "server";
  };

  # Tailscale Serve authenticates the caller; Rex maps only this identity to
  # the existing personal server and its sessions.
  services.rex.loginServer = {
    enable = true;
    accounts.${user}.principals = [ "tailscale:segfaultmedaddy@github" ];
    tailscaleServe.enable = true;
  };

  services.openssh = {
    enable = true;
    ports = [ 22 ];
    settings = {
      PasswordAuthentication = false;
      PermitRootLogin = "prohibit-password";
    };

    listenAddresses = [
      # TODO: add tailscale address here.
    ];
  };

  networking.firewall.allowedTCPPorts = services.openssh.ports;
  networking.firewall.allowedUDPPorts = [ services.tailscale.port ];
  networking.firewall.checkReversePath = "loose";
  # networking.nftables.enable = true;

  programs._1password = {
    enable = true;
  };

  virtualisation.docker.enable = true;
}
