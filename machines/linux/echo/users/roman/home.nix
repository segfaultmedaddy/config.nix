{
  user,
  ...
}:
{
  home.stateVersion = "25.11";

  home.sessionVariables = {
    CONFIG_ROOT_DIR = "/home/${user}/dev/personal/config.nix";
  };

  programs.ssh = {
    matchBlocks."*" = {
      addKeysToAgent = "yes";
    };
  };

  services.ssh-agent = {
    enable = true;
  };
}
